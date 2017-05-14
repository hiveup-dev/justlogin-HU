class RemoveInSummaryInProductFeautre < ActiveRecord::Migration
  def change
    remove_column :refinery_products_product_features, :is_in_summary
  end
end
