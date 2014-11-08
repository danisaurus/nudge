set :environment, "development"
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}


namespace :events do
  desc "Rake task to check triggers"
  task :check_triggers => :environment do
    triggers = Trigger.all
    current_time = Time.now
    triggers.each do | trigger |
      trigger_type = Trigger_type.find(trigger.trigger_type_id)
      time_lapsed = current_time - trigger.last_run_timestamp
      if time_lapsed > duration
        TriggerTaskWorker.perform_async(trigger_type.method_name, trigger.id)
      end
      trigger.last_run_timestamp = Time.now
    end
  end

end


