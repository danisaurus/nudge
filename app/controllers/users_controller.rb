class UsersController < ApplicationController

	def index
	end

	def show
		@user = current_user
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
		respond_to do |format|
		  if @user.save
		  	session[:user_id] = @user.id
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
		params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :gmail, :phone, :twitter)
	end

end
