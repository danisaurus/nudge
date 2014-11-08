class TriggerTaskWorker
  include Sidekiq::Worker
  def perform(method_name, trigger_id)
    send(method, method_name)(trigger_id)
  end
end
