class CreateProductsBenefits < ActiveRecord::Migration

  def up
    create_table :refinery_products_benefits do |t|
      t.string :name
      t.string :description
      t.string :source
      t.text :feature_summary
      t.text :feature
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-products"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/products/benefits"})
    end

    drop_table :refinery_products_benefits

  end

end
