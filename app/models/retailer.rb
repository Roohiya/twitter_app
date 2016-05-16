class Retailer < ActiveRecord::Base
	def self.create_retailer_from_tweet(tweet, retailer_name, coupon_code)
		has_many :contacts
		validates_presence_of :retailer_name, :contact_id, :coupon_code, :contact_username, :tweet_text, :retweet_count, :favourite_count
		validates_uniqueness_of :retailer_name, :scope => [:contact_id, :coupon_code]

	    create!(
	    	retailer_name: retailer_name,
	    	contact_id: tweet.user.id,
			coupon_code: coupon_code,
			contact_username: tweet.user.name,
			tweet_text: tweet.text,
			retweet_count: tweet.retweet_count,
			favourite_count: tweet.favorite_count
	    )
  	end
end
