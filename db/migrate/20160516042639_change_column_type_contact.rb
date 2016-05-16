class ChangeColumnTypeContact < ActiveRecord::Migration
  def change
  		change_column(:contacts, :contact_id, :string)
  end
end
