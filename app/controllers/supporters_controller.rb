class SupportersController < ApplicationController
	include UsersHelper

	def index
		@user = current_user
		@supporters = @user.supporters
	end

	def new
		@user = current_user
		@supporter = Supporter.new(user: @user)
	end

	def create
		@trigger = Trigger.new
		@user = current_user
		@supporter = Supporter.new(supporter_params)
		@supporter.user = @user
		  if @supporter.save
		    render partial: "show.html", formats: :html
		  end
	end

	def edit
		@supporter = Supporter.find(params[:id])
		@user = @supporter.user
		render partial: "edit.html", formats: :html
	end

	def update
		@supporter = Supporter.find(params[:id])
		@user = @supporter.user
	  if @supporter.update(supporter_params)
	    render partial: "show.html", formats: :html
		end
	end

	def show
		@supporter = Supporter.find(params[:id])
		@user = curent_user
	end

	def destroy
		Supporter.find(params[:supporter_id]).destroy
    render nothing: true
	end

	private

	def supporter_params
		params.require(:supporter).permit(:first_name, :last_name, :gmail, :phone, :twitter)
	end
end
