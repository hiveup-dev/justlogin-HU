class AddFileToPolicies < ActiveRecord::Migration
  def change
    add_column :refinery_policies, :file_id, :integer, index: true
  end
end
