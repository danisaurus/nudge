url = URI.parse(ENV["REDISCLOUD_URL"] || "redis://localhost:6379/")
REDIS = Redis.new(url: url)
