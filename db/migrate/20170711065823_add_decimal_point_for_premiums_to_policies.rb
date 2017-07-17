class AddDecimalPointForPremiumsToPolicies < ActiveRecord::Migration
  def change
    change_column :refinery_policies, :premium, :decimal, :precision => 8, :scale => 2
  end
end
