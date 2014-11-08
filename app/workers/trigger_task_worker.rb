class TriggerTaskWorker
  include Sidekiq::Worker

  def perform(trigger_id)
      trigger = Trigger.find(trigger_id)
      trigger.hello_world
  end
end
