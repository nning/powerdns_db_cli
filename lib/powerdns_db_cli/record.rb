module PowerDNS
  module DB
    class Record < ActiveRecord::Base
      belongs_to :domain

      self.inheritance_column = :sti

      validates :domain_id,
        presence: true

      validates :name,
        presence: true

      validates :ttl,
        numericality: {
          only_integer: true,
          greater_than_or_equal_to: 0
        }

      before_validation :append_domain_name!, if: :domain_id?
      before_save :update_change_date
      after_save :update_soa_serial
      after_destroy :update_soa_serial

      # We do not use the conventional serial format (e.g. 1970010199), because
      # the serial update counter is limited to two digits which is a problem
      # with DynDNS.
      #
      # The serial has the format:
      #   <year><month-plus-20><four-digit-update-counter>
      #   e.g. 1970219999
      #
      # Maximum serial in PowerDNS is 2147483647.
      # See https://github.com/PowerDNS/pdns/issues/4943
      def update_serial
        return if self.type != 'SOA'

        a = self.content.split(' ')

        # Last 4 digits of serial (serial update counter)
        i = a[2][6..-1].to_i

        # 201801 -> 201821
        t = Time.now.strftime('%Y%m').to_i + 20

        # Reset serial update counter if serial is on "old" format (e.g.
        # 2018010199)
        i = 0 if a[2][4..5].to_i <= 12

        # Increment serial update counter
        i += 1

        a[2] = t.to_s + "%04d" % i
        self.content = a.join(' ')
      end

      def update_serial!
        update_serial
        save!
      end

      private

      def append_domain_name!
        if self.name.blank?
          self.name = self.domain.name
        else
          unless self.name.include?(self.domain.name)
            self.name << ".#{self.domain.name}"
          end
        end
      end

      def update_change_date
        self.change_date = Time.now.to_i
      end

      def update_soa_serial
        unless self.type == 'SOA' || @serial_updated || self.domain.slave?
          self.domain.soa_record.update_serial!
          @serial_updated = true
        end
      end
    end
  end
end
