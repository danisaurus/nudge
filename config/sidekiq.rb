require 'sidekiq'

Sidekiq.configure_server do |config|
  config.redis = {url: ENV["REDISCLOUD_URL"], namespace: 'sidekiq'}
  database_url = ENV['DATABASE_URL']
  if database_url
    ENV['DATABASE_URL'] = "#{database_url}?pool=25"
    ActiveRecord::Base.establish_connection
  end
end


