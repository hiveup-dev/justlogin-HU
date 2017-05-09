module Refinery
  module Products
    module Admin
      class PlansController < ::Refinery::AdminController

        crudify :'refinery/products/plan',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def plan_params
          params.require(:plan).permit(:icon_name, :name, :description, :definition)
        end
      end
    end
  end
end
