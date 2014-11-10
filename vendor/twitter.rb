class TwitterClient

	def initialize(token)
		@client = Twitter::REST::Client.new do |config|
  			config.consumer_key        = ENV["CONSUMER_KEY"]
  			config.consumer_secret     = ENV["CONSUMER_SECRET"]
  			config.access_token        = token.access_token
  			config.access_token_secret = token.secret
  		end
  	end

  	def get_tweets(num_of_tweets, username)
  		@client.user_timeline(username, {count: num_of_tweets})
  	end

end