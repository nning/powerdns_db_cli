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
    end
  end
end
