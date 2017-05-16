module Refinery
  module Products
    class Product < Refinery::Core::BaseModel
      self.table_name = 'refinery_products'

      has_many :product_feature_products,  ->{ order('refinery_products_product_features_products.position')},
                                          class_name: 'Refinery::Products::ProductFeaturesProduct',
                                          foreign_key: 'product_id',
                                          inverse_of: :product,
                                          dependent: :destroy

      has_many :product_summary_feature_products, ->{ order('refinery_products_product_features_products.position')
                                                      .where('refinery_products_product_features_products.is_in_summary')
                                                     },
                                                  class_name: 'Refinery::Products::ProductFeaturesProduct',
                                                  foreign_key: 'product_id',
                                                  inverse_of: :product



      has_many :product_features, through: :product_feature_products
      has_many :summary_features, through: :product_summary_feature_products

      accepts_nested_attributes_for :product_feature_products, :allow_destroy => true

      validates :name, :insurer, :presence => true

      belongs_to :logo, :class_name => '::Refinery::Image'
      belongs_to :benefit, class_name: 'Refinery::Products::Benefit', foreign_key: 'benefit_id', inverse_of: :products

      acts_as_indexed :fields => [:email, :first_name, :last_name]

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
