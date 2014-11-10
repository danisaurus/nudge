class SessionsController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create]
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_gmail(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to current_user
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end
end
