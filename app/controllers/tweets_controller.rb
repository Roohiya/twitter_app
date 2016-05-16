class TweetsController < ApplicationController
  def index
  	root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  	require "rubygems"
    require "twitter"
    require "uri"    
	require "addressable/uri"
	require File.join(root + '/..', "config", "environment")

    OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)

	#==========================
    # Twitter REST API
    #==========================
	@client = Twitter::REST::Client.new do |config|
	  config.consumer_key = 'i8WYMouugTHnAvlDhWDL62Kyy'
      config.consumer_secret =  '4T1dBgYkDUHFG7fJr1KgyOF0qUJpWFQFIeKAM6a0FFIUG0sAsU'
      config.oauth_token = '1307095608-dLmV4UnL9hLTd3YHsuzaE1mgFlWu4TUufOhdV2G'
      config.oauth_token_secret = 'iCtvgXbRfQq6qE8J61hfHVKfd34kiUyEZsseS1WB5XzHx'
	end

	@client.search("refr.cc").each do |tweet|
		@urlString = ""
		tweet.urls.each do |u|
			str = u.expanded_url.to_s
			if str.include? "refr.cc"
				@urlString = u.expanded_url
				break
			end
		end

		uri = Addressable::URI.parse(@urlString)
		posOfDot = uri.host.index(".")
		retailer_name = uri.host[0..posOfDot-1]
		coupon_code = uri.path[1..-1]
		if !Tweet.exists?(:tweet_id =>tweet.id) 
			Tweet.create_from_tweet(tweet, @urlString, retailer_name, coupon_code)	
			if !Contact.exists?(:contact_id =>tweet.user.id, :contact_username => tweet.user.name, :coupon_code =>coupon_code) 
				Contact.create_contact_from_tweet(tweet, coupon_code, retailer_name)
			end
			if !Retailer.exists?(:retailer_name =>retailer_name, :contact_id => tweet.user.id, :coupon_code => coupon_code) 
				Retailer.create_retailer_from_tweet(tweet, retailer_name, coupon_code)
			end
		end
	end

	#==========================
    # Twitter STREAM API
    #==========================
	# @client = Twitter::Streaming::Client.new do |config|
	# config.consumer_key        = "i8WYMouugTHnAvlDhWDL62Kyy"
	# config.consumer_secret     = "4T1dBgYkDUHFG7fJr1KgyOF0qUJpWFQFIeKAM6a0FFIUG0sAsU"
	# config.access_token        = "1307095608-dLmV4UnL9hLTd3YHsuzaE1mgFlWu4TUufOhdV2G"
	# config.access_token_secret = "iCtvgXbRfQq6qE8J61hfHVKfd34kiUyEZsseS1WB5XzHx"
	# end

	# @client.filter(track: "refr.cc") do |tweet|
    #  		puts tweet.text if tweet.is_a?(Twitter::Tweet)
	# end


	@tweets = Tweet.all
  end
end
