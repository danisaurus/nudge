Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], {
    scope: ['email',
      'https://www.googleapis.com/auth/gmail.readonly'],
      access_type: 'offline'}
  provider :twitter, ENV["CONSUMER_KEY"], ENV["CONSUMER_SECRET"]
end
