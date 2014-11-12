namespace :events do
  desc "Rake task to check triggers"
  task :check_triggers => :environment do
    triggers = Trigger.all
    current_time = Time.now
    triggers.each do | trigger |
        perform(trigger)
    end
  end

  def perform(trigger)
      user = User.find(trigger.user_id)
      user.send(trigger.task.method, trigger)
  end

end


