class DailyReport < ActiveRecord::Base
  belongs_to :user
  has_many :tweets

  def set_tweet_sentiment_average
    self.average_tweet_sentiment = self.tweets.reduce{ |sum, tweet| sum + tweet.quantitative }
  end


end
