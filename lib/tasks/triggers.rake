namespace :events do
  desc "Rake task to check triggers"
  task :check_triggers => :environment do
    triggers = Trigger.all
    current_time = Time.now
    triggers.each do | trigger |
      task = Task.find(trigger.task_id)
      # time_lapsed = current_time - trigger.time_last_run
      # if time_lapsed > task.frequency
        TriggerTaskWorker.perform_async(trigger.id)
      # end
      # trigger.time_last_run = Time.now
      # trigger.save
    end
  end

end


