namespace :daily_reports do
  desc "Set up daily report for each user"
  task :create => :environment do
    User.all.each do |user|
      daily_report = DailyReport.new
      daily_report.user = user
      if user.twitter_token
        user.get_daily_tweets(daily_report)
      end
      if user.gmail_token
        user.get_daily_gmails(daily_report)
      end
      user.get_daily_check_ins(daily_report)
      daily_report.save
    end
  end

end
