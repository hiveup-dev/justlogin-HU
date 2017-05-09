class CreateProductsPlans < ActiveRecord::Migration

  def up
    create_table :refinery_products_plans do |t|
      t.string :icon_name
      t.string :name
      t.string :description
      t.string :definition
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-products"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/products/plans"})
    end

    drop_table :refinery_products_plans

  end

end
