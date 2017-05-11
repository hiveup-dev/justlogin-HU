class AddBenefitIdToProducts < ActiveRecord::Migration
  def change
    add_column :refinery_products, :benefit_id, :integer
    change_column :refinery_products, :special, :string
  end
end
