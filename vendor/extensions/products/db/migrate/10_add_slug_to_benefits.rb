class AddSlugToBenefits < ActiveRecord::Migration
  def change
    add_column :refinery_products_benefits, :slug, :string
  end
end
