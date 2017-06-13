# This migration comes from refinery_policies (originally 7)
class AddFileToPolicies < ActiveRecord::Migration
  def change
    add_column :refinery_policies, :file_id, :integer, index: true
  end
end
