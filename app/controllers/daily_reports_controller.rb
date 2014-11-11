class DailyReportsController < ApplicationController

  def weekly_report
    weekly_scores = []
    user = current_user
    weekly_report = user.daily_reports.order("id desc").limit(7)
    weekly_report.each do |report|
      score = {}
      score["twitter"] = report.data_average("tweets")
      score["gmails"] = report.data_average("gmails")
      score["check_ins"] = report.data_average("check_ins")
      weekly_scores << score
    end
    respond_to do |format|
      format.json {render json:  weekly_scores.to_json}
      format.html {redirect_to "/"}
    end
  end

end
