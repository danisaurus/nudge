require 'rails_helper'

RSpec.describe Supporter, :type => :model do

	describe "associations" do
	  it { should belong_to(:user) }
	end

	describe "validations" do
		it do
	    should allow_value('(773)-633-3299', '2122345657').
	      for(:phone)
	  end

		it do
	    should_not allow_value('123').
	      for(:phone)
	  end

	  it { should validate_presence_of(:first_name) }

	  it { should validate_presence_of(:phone) }
	end

end
