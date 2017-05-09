module Refinery
  module Products
    module Admin
      class ProductsController < ::Refinery::AdminController

        crudify :'refinery/products/product',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def product_params
          params.require(:product).permit(:name, :logo_id, :insurer, :premium, :special, product_feature_products_attributes: [:id, :product_feature_id, :value, :_destroy])
        end
      end
    end
  end
end
