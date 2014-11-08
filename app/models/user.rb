class User < ActiveRecord::Base
  has_many :supporters
  has_many :triggers
  has_many :trigger_histories
  phony_normalize :phone, :default_country_code => 'US'

end
