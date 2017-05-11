class AddIconNameToBenefits < ActiveRecord::Migration
  def change
    add_column :refinery_products_benefits, :icon_name, :string
    change_column :refinery_products_benefits, :description, :string, length: 500
    change_column :refinery_products, :special, :string, length: 200
  end
end
