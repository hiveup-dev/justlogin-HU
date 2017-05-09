module Refinery
  module Products
    module Admin
      class UserSubmissionsController < ::Refinery::AdminController

        crudify :'refinery/products/user_submission',
                :title_attribute => 'first_name'

        private

        # Only allow a trusted parameter "white list" through.
        def user_submission_params
          params.require(:user_submission).permit(:first_name, :last_name)
        end
      end
    end
  end
end
