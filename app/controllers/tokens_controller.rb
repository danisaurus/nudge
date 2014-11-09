class TokensController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @auth = request.env['omniauth.auth']['credentials']
    token = Token.create(
      access_token: @auth['token'],
      refresh_token: @auth['refresh_token'],
      expires_at: Time.at(@auth['expires_at']).to_datetime)
    current_user.tokens << token
    redirect_to current_user
  end
end
