class CreateProductsUserSubmissions < ActiveRecord::Migration

  def up
    create_table :refinery_products_user_submissions do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :company
      t.string :phone_number
      t.string :other_inquiries
      t.integer :position
      t.timestamps
    end

    create_table :refinery_products_products_user_submissions do |t|
      t.integer :product_id
      t.integer :user_submission_id
    end

    add_index(:refinery_products_products_user_submissions, [:product_id, :user_submission_id], { name: 'products_product_id_user_submission_id' })

    create_table :refinery_products_benefits_user_submissions do |t|
      t.integer :benefit_id
      t.integer :user_submission_id
    end

    add_index(:refinery_products_benefits_user_submissions, [:benefit_id, :user_submission_id], { name: 'products_benefit_id_user_submission_id' })

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({ :name => "refinerycms-products" })
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({ :link_url => "/products/user_submissions" })
    end

    drop_table :refinery_products_user_submissions

  end

end
