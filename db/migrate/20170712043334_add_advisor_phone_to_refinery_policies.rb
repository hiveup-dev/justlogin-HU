class AddAdvisorPhoneToRefineryPolicies < ActiveRecord::Migration
  def change
    add_column :refinery_policies, :advisor_phone, :string
  end
end
