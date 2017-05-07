# This migration comes from refinery_products (originally 3)
class CreateProductsProductFeaturesProducts < ActiveRecord::Migration

  def up
    create_table :refinery_products_product_features_products do |t|
      t.integer :product_feature_id
      t.integer :product_id
      t.string  :value
      t.integer :position
      t.timestamps
    end
    add_index(:refinery_products_product_features_products, [:product_feature_id, :product_id], name: 'product_feature_product_idx')

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({ :name => "refinerycms-products" })
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({ :link_url => "/products/product_features_products" })
    end

    drop_table :refinery_products_product_features_products

  end

end
