class RenameColumnNameRetailer < ActiveRecord::Migration
  def change
  	rename_column :retailers, :customer_id, :contact_id
  	rename_column :retailers, :customer_username, :contact_username
  end
end
