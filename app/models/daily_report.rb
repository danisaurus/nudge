class DailyReport < ActiveRecord::Base
  belongs_to :user
  has_many :tweets

  def set_tweet_sentiment_average
    self.average_tweet_sentiment = self.tweets.map{|tweet| tweet.quantitative }.inject(:+)
  end

  def set_email_sentiment_average
    self.average_email_sentiment = self.gmails.map{|tweet| tweet.quantitative }.inject(:+)
  end

end
