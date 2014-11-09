require 'history_getter'

class User < ActiveRecord::Base
  has_many :supporters
  has_many :triggers
  has_many :trigger_histories
  has_many :tokens
  phony_normalize :phone, :default_country_code => 'US'

  has_secure_password

  def active?
    if self.last_history_number != find_last_history_id
      self.last_active = Time.now
      self.save
      true
    end
  end

  def find_last_history_id
    history_getter = HistoryGetter.new(gmail, tokens.first)
    history_getter.get_last_history_id
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

end
