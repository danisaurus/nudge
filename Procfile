web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
worker: bundle exec sidekiq -e production
heroku config:set REDIS_PROVIDER=REDISTOGO_URL
