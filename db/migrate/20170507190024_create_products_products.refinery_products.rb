# This migration comes from refinery_products (originally 1)
class CreateProductsProducts < ActiveRecord::Migration

  def up
    create_table :refinery_products do |t|
      t.string :name
      t.integer :logo_id
      t.string :insurer
      t.decimal :premium, :precision => 8, :scale => 2
      t.string :special, length: 1000
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-products"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/products/products"})
    end

    drop_table :refinery_products

  end

end
