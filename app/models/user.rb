require 'history_getter'

class User < ActiveRecord::Base
  has_many :supporters
  has_many :triggers
  has_many :trigger_histories
  phony_normalize :phone, :default_country_code => 'US'

  def active?

  end

  def find_last_history_id
    history_getter = HistoryGetter.new(self.gmail, self.token.last.fresh_token)
  end

end
