class UsersController < ApplicationController

	def index
	end

	def show
		# @user = curent_user
		@user = User.find(params[:user_id]) # uncomment line above once we have a current_user method
	end

	def edit
		# @user = curent_user
		@user = User.find(params[:user_id]) # uncomment line above once we have a current_user method
	end

	def update
		# @user = curent_user
		@user = User.find(params[:user_id]) # uncomment line above once we have a current_user method
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
		respond_to do |format|
		  if @user.save
		    format.html { redirect_to @user, notice: 'User was successfully created.' }
		  else
		    format.html { render :new }
		  end
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		respond_to do |format|
			format.html { return redirect_to root_url, notice: "User was successfully destroyed."}
		end
	end
	
	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :gmail, :phone, :twitter)
	end

end