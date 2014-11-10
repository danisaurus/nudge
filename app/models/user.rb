require 'gmail_api_client'
require 'twitter_client'
require 'alchemyapi'

class User < ActiveRecord::Base
  has_many :supporters
  has_many :tweets
  has_many :triggers
  has_many :trigger_histories
  has_many :tokens
  phony_normalize :phone, :default_country_code => 'US'

  has_secure_password

  def set_token(token)
    self.tokens << token
    self.set_history_id
  end

  def twitter_token
    self.tokens.where('type=?', "TwitterToken").first
  end

  def gmail_token
    self.tokens.where('type=?', "GmailToken").first
  end

  def active?
    if self.last_history_number != find_last_history_id
      update_active_time
      return true
    end
    return false
  end

  def update_active_time
    self.last_active = Time.now
    self.set_history_id
    self.save
  end

  def find_last_history_id
    client = GmailAPI.new(self.gmail_token)
    return client.get_last_history_id
  end

  def check_email_activity(trigger)
    unless active_in_last_hours?(trigger.duration_in_hours/60.to_f)
      self.supporters.each do |supporter|
        supporter.text(trigger.message_text)
      logger.info "checking the email activity method in #{supporter.first_name}, #{self.email}"
      end
    end

    # trigger.time_last_run = Time.now
    # trigger.save
  end

  def set_history_id
    self.last_history_number = find_last_history_id
  end

  def active_in_last_hours?(inactivity_time_limit)
    active?
    time_since_last_active = Time.now - self.last_active
    return (time_since_last_active / 3600.to_f) < inactivity_time_limit
  end

  def get_daily_tweets
    client = TwitterClient.new(self.twitter_token)
    tweets = client.get_most_recent_tweets(self.tweets.last.id_of_tweet)
    tweets.each do |tweet|
      Tweet.create!(user: self, id_of_tweet: tweet.id)
    end
  end

  def most_recent_tweet_id
    client = TwitterClient.new(self.twitter_token)
    tweet = client.get_tweets(1)[0]
    Tweet.create!(user: self, id_of_tweet: tweet.id)
  end
end
