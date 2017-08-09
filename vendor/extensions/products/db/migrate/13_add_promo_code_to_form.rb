class AddPromoCodeToForm < ActiveRecord::Migration
  def change
    add_column :refinery_products_user_submissions, :promo_code, :string
  end
end
