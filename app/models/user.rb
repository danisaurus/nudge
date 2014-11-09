class User < ActiveRecord::Base
  has_many :supporters
  has_many :triggers
  has_many :trigger_histories
  has_many :tokens
  phony_normalize :phone, :default_country_code => 'US'
  has_secure_password

  def check_email(trigger)
  #if Email.check(self.id)
    if true
      self.supporters.each do |supporter|
        supporter.text(trigger.message_text)
      end
    end
    trigger.time_last_run = Time.now
    trigger.save
  end

  def hello_world
    p "Hello_world"
  end

end
