require 'sidekiq'


# When in Unicorn, this block needs to go in unicorn's `after_fork` callback:
# Configure the CLIENT
Sidekiq.configure_client do |config|
  config.redis = {url: ENV["REDISCLOUD_URL"], namespace: 'sidekiq'}

end


# Configure the SERVER
# define HEROKU_PROCESS in the Procfile:
#
#    default: env HEROKU_PROCESS=default bundle exec sidekiq -r ./background/boot.rb
#    import:  env HEROKU_PROCESS=import bundle exec sidekiq -q import -c 1 -r ./background/boot.rb
Sidekiq.configure_server do |config|
  config.redis = {url: ENV["REDISCLOUD_URL"], namespace: 'sidekiq'}

  # Heroku sets DATABASE_URL
  # For concurrency and High IO:
  # See: https://github.com/mperham/sidekiq/wiki/Advanced-Options
  database_url = ENV['DATABASE_URL']
  if (database_url)
    concurrency = Sidekiq.options[:concurrency].to_i
    # This will be the case on Heroku deployed environments
    uri = URI.parse(database_url)
    puts "Original DATABASE_URL => #{uri}"
    pool_size = (concurrency * 1.6).round(0)
    params = {}
    params['pool'] = pool_size
    uri.query = "#{params.to_query}"
    ENV['DATABASE_URL'] = uri.to_s
    puts "Sidekiq Server is reconnecting with new pool size: #{params['pool']} - DATABASE_URL => #{uri}"
    ActiveRecord::Base.establish_connection
  else
    # This will be the case in local environments (development & test)
    # Even trying to limit the concurrency results in too many connections.
    # So we just go with one per queue unless specified as ENV['SIDEKIQ_CONCURRENCY'].
    if ENV['SIDEKIQ_CONCURRENCY']
      Sidekiq.options[:concurrency] = ENV['SIDEKIQ_CONCURRENCY'].to_i
    else
      Sidekiq.options[:concurrency] = 1
    end
  end


