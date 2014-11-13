require 'module_text'

class Supporter < ActiveRecord::Base
  belongs_to :user
  phony_normalize :phone, :default_country_code => 'US' # takes care of the many different ways to input a phone number
  validates :phone, :phony_plausible => true

  validates_presence_of :first_name, :phone

end
