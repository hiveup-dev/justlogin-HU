class AddInSummaryToProductFeaturesProducts < ActiveRecord::Migration
  def change
    add_column :refinery_products_product_features_products, :is_in_summary, :boolean
  end
end
