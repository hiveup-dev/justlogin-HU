module Refinery
  module Products
    module Admin
      class FeatureGroupsController < ::Refinery::AdminController

        crudify :'refinery/products/feature_group',
                :title_attribute => 'name',
                :sortable => true,
                :order => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def feature_group_params
          params.require(:feature_group).permit(:name)
        end
      end
    end
  end
end
