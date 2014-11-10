require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = {url: ENV["REDISCLOUD_URL"], namespace: 'sidekiq'}

end

Sidekiq.configure_server do |config|
  config.redis = {url: ENV["REDISCLOUD_URL"], namespace: 'sidekiq'}
  ActiveRecord::Base.establish_connection
end


