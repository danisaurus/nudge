class UsersController < ApplicationController

	def index
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		respond_to do |format|
		  if @user.update(user_params)
		    format.html { redirect_to @user, notice: 'User was successfully updated.' }
		    # format.json { render :show, status: :ok, location: @user }
		  else
		    format.html { render :edit }
		    # format.json { render json: @user.errors, status: :unprocessable_entity }
		  end
		end
	end

	def new
	end

	def create
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :gmail, :phone, :twitter)
	end

end