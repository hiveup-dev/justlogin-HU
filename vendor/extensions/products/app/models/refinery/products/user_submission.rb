module Refinery
  module Products
    class UserSubmission < Refinery::Core::BaseModel

      has_and_belongs_to_many :products, join_table: 'refinery_products_products_user_submissions',
                              foreign_key: 'user_submission_id',
                              association_foreign_key: 'product_id'

      has_and_belongs_to_many :plans, join_table: 'refinery_products_plans_user_submissions',
                              foreign_key: 'user_submission_id',
                              association_foreign_key: 'plan_id'
      validates :first_name, :last_name, :email, :company, :phone_number,
                :presence => true, :uniqueness => true
      validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\W]+\z/ }

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
