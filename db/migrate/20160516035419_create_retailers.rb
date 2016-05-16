class CreateRetailers < ActiveRecord::Migration
  def change
    create_table :retailers do |t|
      t.string :retailer_name
      t.string :coupon_code
      t.string :customer_id
      t.string :customer_username
      t.string :tweet_text
      t.integer :retweet_count
      t.integer :favourite_count

      t.timestamps null: false
    end
  end
end
