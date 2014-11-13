require 'rails_helper'

RSpec.describe Trigger, :type => :model do

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:task) }
  end

  describe "validations" do
    it { should validate_presence_of(:message_text) }
  end

end
