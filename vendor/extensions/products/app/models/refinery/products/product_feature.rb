module Refinery
  module Products
    class ProductFeature < Refinery::Core::BaseModel

      has_many :product_feature_products, class_name: 'Refinery::Products::ProductFeaturesProduct',
                                           foreign_key: 'product_feature_id',
                                           inverse_of: :product_feature,
                                           dependent: :destroy

      validates :name, :presence => true, :uniqueness => true
      scope :order_by_name, ->() {
            unscoped.order(:name)
      }
      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
