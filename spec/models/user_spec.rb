require 'rails_helper'

RSpec.describe User, :type => :model do

  describe "associations" do
    it { should have_many(:supporters) }
    it { should have_many(:daily_reports) }
    it { should have_many(:check_ins) }
    it { should have_many(:tweets) }
    it { should have_many(:triggers) }
    it { should have_many(:tokens) }
  end

  describe "validations" do
    it { should have_secure_password }
    it { should validate_uniqueness_of(:gmail) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:gmail) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

end
