require 'rails_helper'

RSpec.describe Supporter, :type => :model do

	describe "validations" do
		it "should not be a valid supporter if they don't have a way to be contacted" do
			not_valid = Supporter.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
			expect(not_valid.valid?).to be_falsey
		end

		it "should be a valid supporter if they have a way to be contacted" do
			valid = Supporter.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, gmail: Faker::Internet.email)
			expect(valid.valid?).to be_truthy
		end

		it "should not accept invalid phone numbers" do
			not_valid = Supporter.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone: "123")
			expect(not_valid.valid?).to be_falsey
		end

		it "should be okay with valid phone numbers" do
			valid = Supporter.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone: "(773)-633-3299")
			expect(valid.valid?).to be_truthy
		end
	end

end
