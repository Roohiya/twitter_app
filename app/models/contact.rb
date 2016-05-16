class Contact < ActiveRecord::Base
	has_many :tweets

	def self.create_contact_from_tweet(tweet, coupon_code, retailer_name)

		validates_presence_of :contact_id, :contact_username, :coupon_code, :retweet_count, :retailer_name
		validates_uniqueness_of :contact_id, scope: [:contact_username, :coupon_code]

	    create!(
	    	contact_id: tweet.user.id,
			contact_username: tweet.user.name,
			coupon_code: coupon_code,
			retweet_count: tweet.retweet_count.to_i,
			retailer_name: retailer_name
	    )
  	end
end
