web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
worker: bundle exec sidekiq -e production
default: env HEROKU_PROCESS=default bundle exec sidekiq
