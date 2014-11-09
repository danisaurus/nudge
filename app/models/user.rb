require 'gmail_api_client'

class User < ActiveRecord::Base
  has_many :supporters
  has_many :triggers
  has_many :trigger_histories
  has_one :token
  phony_normalize :phone, :default_country_code => 'US'

  has_secure_password

  def active?
    if self.last_history_number != find_last_history_id
      self.last_active = Time.now
      self.set_history_id
      self.save
      return true
    end
    return false
  end

  def find_last_history_id
    client = GmailAPI.new(self.token)
    histID = client.get_last_history_id
  end

  def check_email_activity(trigger)
    if !active?
     if Time.now - self.last_active > trigger.duration
        self.supporters.each do |supporter|
          supporter.text(trigger.message_text)
        end
      end
    end
    # trigger.time_last_run = Time.now
    # trigger.save
  end

  def set_history_id
    self.last_history_number = find_last_history_id
  end

  def active_in_last_hours?(inactivity_time_limit)
    time_since_last_active = Time.now - self.last_active
    return (time_since_last_active / 3600.to_f) > inactivity_time_limit
  end

end
