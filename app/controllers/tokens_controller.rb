class TokensController < ApplicationController
  include UsersHelper

  def new
    @user = User.new
  end

  def create_gmail_token
    if current_user.gmail_token.nil?
      @auth = request.env['omniauth.auth']['credentials']
      token = GmailToken.create(
        access_token: @auth['token'],
        refresh_token: @auth['refresh_token'],
        expires_at: Time.at(@auth['expires_at']).to_datetime
        )
      current_user.set_token(token)
      current_user.find_last_history_id
      current_user.save
      render :new
    else
      render :new
    end
  end

  def create_twitter_token
    if current_user.twitter_token.nil?
      @auth = request.env['omniauth.auth']['credentials']
      token = TwitterToken.create(
        access_token: @auth['token'],
        secret: @auth['secret']
        )
      current_user.tokens << token
      current_user.daily_reports.last.tweets << current_user.most_recent_tweet
      current_user.save
      render :new
  else
      render :new
    end
  end

end
