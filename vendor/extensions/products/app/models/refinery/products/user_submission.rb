module Refinery
  module Products
    class UserSubmission < Refinery::Core::BaseModel

      has_and_belongs_to_many :products
      has_and_belongs_to_many :benefits

      validates :first_name, :last_name, :email, :company, :phone_number,
                :presence => true
      validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\W]+\z/ }
      validates_acceptance_of :terms, accept: 'yes'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      acts_as_indexed :fields => [:email, :first_name, :last_name]


      def benefit_names
        self.benefits.pluck(:name).join(' | ')
      end

      def product_names
        self.products.pluck(:name).join(' | ')
      end
    end
  end
end
