namespace :events do
  desc "Rake task to check triggers"
  task :check_triggers => :environment do
    triggers = Trigger.all
    current_time = Time.now
    triggers.each do | trigger |
      # task = Task.find(trigger.task_id)
      # time_lapsed = Time.now - trigger.time_last_run
     # if time_lapsed > task.frequency
        TriggerTaskWorker.perform_in(2.minutes, trigger.id)
     # end
    end
  end

end


