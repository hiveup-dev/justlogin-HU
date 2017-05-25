module Refinery
  module Products
    module Admin
      class BenefitsController < ::Refinery::AdminController

        crudify :'refinery/products/benefit',
                :title_attribute => 'name',
                :sortable => true,
                :order => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def benefit_params
          params.require(:benefit).permit(:name, :description, :source, :feature_summary, :feature)
        end
      end
    end
  end
end
