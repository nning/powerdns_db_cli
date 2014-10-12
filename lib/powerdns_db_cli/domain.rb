module PowerDNS
  module DB
    class Domain < ActiveRecord::Base
      IP_ADDR_REGEX = /\A(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\z/
      TYPES = %w[NATIVE MASTER SLAVE]

      has_many :records, dependent: :destroy

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
    end
  end
end
