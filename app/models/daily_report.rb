class DailyReport < ActiveRecord::Base
  belongs_to :user
  has_many :tweets
  has_many :gmails
  has_many :check_ins

  def set_tweet_sentiment_average
    self.average_tweet_sentiment = self.tweets.map{|tweet| tweet.quantitative }.inject(:+)
  end

  def set_email_sentiment_average
    self.average_email_sentiment = self.gmails.map{|tweet| tweet.quantitative }.inject(:+)
  end

end
