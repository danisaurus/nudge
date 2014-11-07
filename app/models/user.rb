class User < ActiveRecord::Base
  has_many :supporters
  phony_normalize :phone, :default_country_code => 'US'

  validates :first_name, presence: true
  validates :gmail, presence: true
end
