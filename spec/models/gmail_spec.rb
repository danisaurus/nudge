require 'rails_helper'

RSpec.describe Gmail, :type => :model do

  describe "associations" do
    it { should belong_to(:daily_report) }
    it { should have_many(:keywords) }
  end

end
