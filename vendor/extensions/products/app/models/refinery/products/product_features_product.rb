module Refinery
  module Products
    class ProductFeaturesProduct < Refinery::Core::BaseModel

      belongs_to :product, class_name: 'Refinery::Products::Product', foreign_key: 'product_id'
      belongs_to :product_feature, class_name: 'Refinery::Products::ProductFeature', foreign_key: 'product_feature_id'

      validates :product_feature_id, uniqueness: { scope: :product_id }

      # def title was created automatically because you didn't specify a string field
      # when you ran the refinery:engine generator. <3 <3 Refinery CMS.
      def title
        "Override def title in vendor/extensions/products/app/models/refinery/products/product_features_product.rb"
      end

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
