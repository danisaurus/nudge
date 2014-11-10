require 'gmail_api_client'

class User < ActiveRecord::Base
  has_many :supporters
  has_many :triggers
  has_many :trigger_histories
  has_many :tokens
  phony_normalize :phone, :default_country_code => 'US'

  has_secure_password

  def set_token(token)
    self.token = token
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
    client = GmailAPI.new(self.token)
    return client.get_last_history_id
  end

  def check_email_activity(trigger)
    unless active_in_last_hours?(trigger.duration_in_hours)
      self.supporters.each do |supporter|
        supporter.text(trigger.message_text)
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

end
