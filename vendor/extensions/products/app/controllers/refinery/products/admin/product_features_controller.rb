module Refinery
  module Products
    module Admin
      class ProductFeaturesController < ::Refinery::AdminController

        crudify :'refinery/products/product_feature',
                :title_attribute => 'name',
                :sortable => true,
                :order => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def product_feature_params
          params.require(:product_feature).permit(:name, :value, :feature_group_id)
        end
      end
    end
  end
end
