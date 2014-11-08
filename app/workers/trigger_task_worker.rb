class TriggerTaskWorker
  include Sidekiq::Worker
  def perform(trigger)
    trigger.user.send(trigger.trigger_type.method_name)
  end
end
