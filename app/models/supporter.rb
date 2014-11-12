require 'module_text'

class Supporter < ActiveRecord::Base
  belongs_to :user
  phony_normalize :phone, :default_country_code => 'US' # takes care of the many different ways to input a phone number
  validates :phone, :phony_plausible => true

  validate :must_have_a_way_to_contact
  validates :first_name, presence: true

  include Texter

  def must_have_a_way_to_contact
  	unless phone
  		errors.add(:way_to_contact, "must have at least one of: phone number, twitter handle, gmail")
  	end
  end

end
