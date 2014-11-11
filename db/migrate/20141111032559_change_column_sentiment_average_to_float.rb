class ChangeColumnSentimentAverageToFloat < ActiveRecord::Migration
  def change
    change_column :daily_reports, :average_tweet_sentiment, :float
    change_column :daily_reports, :average_email_sentiment, :float
  end
end
