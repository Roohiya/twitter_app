class ChangeCustomerIdFormatInTweet < ActiveRecord::Migration
  	def change
   		change_column(:tweets, :contact_id, :string)
	end
end
