# This migration comes from refinery_products (originally 6)
class AddPlanNamesToUserSubmissions < ActiveRecord::Migration
  def change
    add_column :refinery_products_user_submissions, :plan_names, :text, array: true, default: []
  end
end
