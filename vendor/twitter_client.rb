class TwitterClient
  attr_reader :client
	def initialize(token)
		@client = Twitter::REST::Client.new do |config|
  			config.consumer_key        = ENV["CONSUMER_KEY"]
  			config.consumer_secret     = ENV["CONSUMER_SECRET"]
  			config.access_token        = token.access_token
  			config.access_token_secret = token.secret
  		end
  	end

  	def get_tweets(num_of_tweets)
  		@client.user_timeline(client.user.screen_name, {count: num_of_tweets})
  	end

    def get_most_recent_tweets(id)
      @client.user_timeline(client.user.screen_name, {since_id: id})
    end

end
