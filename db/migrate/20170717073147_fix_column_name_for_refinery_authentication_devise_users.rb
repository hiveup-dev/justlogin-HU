class FixColumnNameForRefineryAuthenticationDeviseUsers < ActiveRecord::Migration
  def change
    rename_column :refinery_authentication_devise_users, :comapany, :company
  end
end
