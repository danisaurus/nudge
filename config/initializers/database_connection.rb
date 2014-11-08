Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDISTOGO_URL'], namespace: 'my-app' }

  database_url = ENV['DATABASE_URL']
  sidekiq_concurrency = ENV['SIDEKIQ_CONCURRENCY']
  if database_url
    ENV['DATABASE_URL'] = "#{database_url}?pool=25"
    ActiveRecord::Base.establish_connection
  end
end
