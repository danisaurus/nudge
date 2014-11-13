require 'rails_helper'

RSpec.describe DailyReport, :type => :model do

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:tweets) }
    it { should have_many(:gmails) }
    it { should have_many(:check_ins) }
  end


  describe "#data_average" do
    it "should return the average quantitative value of data type" do
      daily_report = DailyReport.create
      happy_tweet = Tweet.create(quantitative: 1)
      sad_tweet = Tweet.create(quantitative: -1)
      daily_report.tweets << happy_tweet << sad_tweet
      expect(daily_report.data_average("tweets")).to eq(0)
    end
  end

end
