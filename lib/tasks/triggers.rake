namespace :events do
  desc "Rake task to check triggers"
  task :check_triggers => :environment do
    triggers = Trigger.all
    triggers.each do | trigger |
        if trigger.active
          perform(trigger)
        end
    end
  end

  def perform(trigger)
      trigger.user.send(trigger.task.method, trigger)
  end

end


