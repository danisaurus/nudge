class UsersController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create]
	def index
	end

	def show
		@user = current_user
		@trigger = Trigger.new
		@supporter = Supporter.new
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		respond_to do |format|
		  if @user.update(user_params)
		    format.html { redirect_to @user, notice: 'User was successfully updated.' }
		  else
		    format.html { render :edit }
		  end
		end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.daily_reports << DailyReport.new
		@user.last_active = Time.now
	  if @user.save
	  	session[:user_id] = @user.id
	    redirect_to get_started_path
	  else
	    render :"sessions/new"
	  end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		respond_to do |format|
			format.html { return redirect_to root_url, notice: "User was successfully destroyed."}
		end
	end

	def toggle_twitter_triggers
		current_user.toggle_twitter_triggers
    render nothing: true
	end

	def toggle_google_triggers
		current_user.toggle_google_triggers
    render nothing: true
	end

	def specific_toggle
    trigger = current_user.triggers.find(params[:trigger_id])
		current_user.toggle(trigger)
    render nothing: true
	end

	def get_started
		@supporter = Supporter.new
		@trigger = Trigger.new
		@user = current_user
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :phone, :gmail, :twitter)
	end

end
