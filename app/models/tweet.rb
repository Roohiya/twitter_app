# Store recorded tweets
class Tweet < ActiveRecord::Base
	def self.create_from_tweet(tweet, urlString, retailer_name, coupon_code)

		validates_presence_of :tweet_id, :tweet_text, :contact_id, :contact_username, :referral_link, :retailer_name, :coupon_code, :tweet_timestamp, :retweet_count
		self.primary_key = 'tweet_id'
		validates_uniqueness_of :tweet_id

	    create!(
	    	tweet_id: tweet.id,
			tweet_text: tweet.text,
			contact_id: tweet.user.id,
			contact_username: tweet.user.name,
			referral_link: urlString,
			retailer_name: retailer_name,
			coupon_code: coupon_code,
			tweet_timestamp: tweet.created_at,
			retweet_count: tweet.retweet_count
	    )
  	end
end