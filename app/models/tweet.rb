require 'twitter'
class Tweet < ActiveRecord::Base
  belongs_to :user
  def get_daily_tweets

  end
end
