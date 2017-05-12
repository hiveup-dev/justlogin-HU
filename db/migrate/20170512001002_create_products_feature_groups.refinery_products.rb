# This migration comes from refinery_products (originally 10)
class CreateProductsFeatureGroups < ActiveRecord::Migration

  def up
    create_table :refinery_products_feature_groups do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

    add_column :refinery_products_product_features, :feature_group_id, :integer

    add_index :refinery_products_product_features, :feature_group_id

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-products"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/products/feature_groups"})
    end

    drop_table :refinery_products_feature_groups

  end

end
