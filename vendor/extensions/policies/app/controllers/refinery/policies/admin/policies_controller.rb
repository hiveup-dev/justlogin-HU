module Refinery
  module Policies
    module Admin
      class PoliciesController < ::Refinery::AdminController

        crudify :'refinery/policies/policy',
                :title_attribute => 'name',
                :sortable => true,
                :order => 'name'

        def populate_employee_list
          if params[:user_id].present?
            @employees = Refinery::Authentication::Devise::User.find(params[:user_id]).employees
          else
            @employees = Refinery::Policies::Employee.all
          end
          respond_to do |format|
            format.json { render json: @employees }
          end
        end

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
