module Refinery
  module Policies
    module Admin
      class PoliciesController < ::Refinery::AdminController

        crudify :'refinery/policies/policy',
                :title_attribute => 'name',
                :sortable => true,
                :order => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def policy_params
          params.require(:policy).permit(:name, :logo_id, :insurer, :premium, :benefit_id, :employee_id, :user_id, :position,
                                         policy_feature_policies_attributes: [:id, :policy_feature_id,
                                                :value, :is_in_summary,
                                                :_destroy])
        end
      end
    end
  end
end
