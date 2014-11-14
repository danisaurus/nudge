module ApplicationHelper
  def print_method_name(trigger)
    if trigger.task.method == 'check_email_activity'
      return 'Email Activity'
    elsif trigger.task.method == 'check_email_sentiment'
      return 'Email Sentiment'
    else
      return 'Twitter Sentiment'
    end
  end
end
