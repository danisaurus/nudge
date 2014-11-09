require 'history_getter'

class User < ActiveRecord::Base
  has_many :supporters
  has_many :triggers
  has_many :trigger_histories
  has_many :tokens
  phony_normalize :phone, :default_country_code => 'US'

  def active?
    self.last_history_number != self.find_last_history_id
  end

  def find_last_history_id
    history_getter = HistoryGetter.new("87265a@gmail.com", "ya29.uAAnm3VCNcKgBkHF0L1a5PhpcxXQI9xX4wIxdqjDa1h5KcaIS165cb75YToDa3gDHatH-w0U-VKVwQ")
    history_getter.get_last_history_id
  end
end
