module Refinery
  module Products
    class Product < Refinery::Core::BaseModel
      self.table_name = 'refinery_products'

      has_many :product_feature_products,  ->(_) {
                                                    joins('JOIN refinery_products_product_features on refinery_products_product_features.id = refinery_products_product_features_products.product_feature_id')
                                                    .order('refinery_products_product_features.is_in_summary desc,
                                                            refinery_products_product_features_products.position')
                                                  },
                                          class_name: 'Refinery::Products::ProductFeaturesProduct',
                                          foreign_key: 'product_id',
                                          inverse_of: :product,
                                          dependent: :destroy

      has_many :product_summary_feature_products, ->(_) {
                                                                order('refinery_products_product_features_products.position')
                                                                joins('JOIN refinery_products_product_features on refinery_products_product_features.id = refinery_products_product_features_products.product_feature_id')
                                                                .where('refinery_products_product_features.is_in_summary')
                                                              },
                                                  class_name: 'Refinery::Products::ProductFeaturesProduct',
               foreign_key: 'product_id',
               inverse_of: :product

      has_many :product_features, through: :product_feature_products

      accepts_nested_attributes_for :product_feature_products, :allow_destroy => true

      validates :name, :presence => true, :uniqueness => true

      belongs_to :logo, :class_name => '::Refinery::Image'

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
