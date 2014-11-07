class Supporter < ActiveRecord::Base
  belongs_to :user
  phony_normalize :phone_number, :default_country_code => 'US'
  validates :phone_number, :phony_plausible => true

  validate :must_have_a_way_to_contact


  def must_have_a_way_to_contact
  	unless phone || twitter || gmail
  		errors.add(:way_to_contact, "must have at least one of: phone number, twitter handle, gmail")
  	end
  end

  def call
  end

end
