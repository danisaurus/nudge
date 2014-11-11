class AddDailyReportToTweets < ActiveRecord::Migration
  def change
    add_reference :tweets, :daily_report
  end
end
