class CreateProductsProductFeatures < ActiveRecord::Migration

  def up
    create_table :refinery_products_product_features do |t|
      t.string :name
      t.boolean :is_in_summary
      t.integer :position

      t.timestamps
    end
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-products"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/products/product_features"})
    end

    drop_table :refinery_products_product_features

  end

end
