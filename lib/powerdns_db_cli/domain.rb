module PowerDNS
  module DB
    class Domain < ActiveRecord::Base
      IP_ADDR_REGEX = /\A(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\z/
      TYPES = %w[NATIVE MASTER SLAVE]

      has_many :records, dependent: :destroy

      after_create :create_soa_record

      self.inheritance_column = :sti

      validates :name,
        presence: true,
        uniqueness: true

      validates :type,
        inclusion: {
          in: TYPES,
          message: "has to be one of #{TYPES.join(', ')}"
        }

      validates :master,
        if: :slave?,
        presence: true,
        format: {
          with: IP_ADDR_REGEX,
          message: 'has to be IP address'
        }

      default_scope { order :name }

      def slave?
        self.type == 'SLAVE'
      end

      def soa_record
        records.where(type: 'SOA').first!
      end

      private

      def create_soa_record
        records.create! \
          name: self.name,
          type: 'SOA',
          content: Config.instance[:default_soa],
          ttl: 38400,
          prio: 0,
          auth: true

        soa_record.update_serial!
      end
    end
  end
end
