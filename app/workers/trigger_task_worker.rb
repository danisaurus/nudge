class TriggerTaskWorker
  include Sidekiq::Worker

  def perform(trigger_id)
      trigger = Trigger.find(trigger_id)
      user = User.find(trigger.user_id)
      user.send(trigger.task.method, trigger)
  end

end
