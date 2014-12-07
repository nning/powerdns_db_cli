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

      def update_serial
        return if self.type != 'SOA'

        a = self.content.split(' ')
        i = a[2][8..-1].to_i + 1
        t = Time.now.strftime('%Y%m%d')

        a[2] = t + "%02d" % i
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
