class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.float :customer_id
      t.string :customer_name
      t.string :coupon_code
      t.integer :retweet_count
      t.string :retailer_name

      t.timestamps null: false
    end
  end
end
