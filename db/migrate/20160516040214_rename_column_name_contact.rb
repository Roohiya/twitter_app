class RenameColumnNameContact < ActiveRecord::Migration
  def change
  	rename_column :contacts, :customer_id, :contact_id
	rename_column :contacts, :customer_name, :contact_username
  end
end
