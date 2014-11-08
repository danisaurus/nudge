class SupportersController < ApplicationController
	include UsersHelper

	def index
		@user = User.find(params[:user_id])
		@supporters = @user.supporters
	end

	def new
		@user = User.find(params[:user_id])
		@supporter = Supporter.new(user: @user)
	end

	def create
		@supporter = Supporter.new(supporter_params)
		@user = User.find(params[:user_id])
		@supporter.user = @user
		respond_to do |format|
		  if @supporter.save
		    format.html { redirect_to user_supporters_path(@user), notice: 'Supporter was successfully created.' }
		    # format.json { render :show, status: :created, location: @supporter }
		  else
		    format.html { render :new }
		    # format.json { render json: @supporter.errors, status: :unprocessable_entity }
		  end
		end
	end

	def edit
		@supporter = Supporter.find(params[:id])
		@user = @supporter.user
	end

	def update
		@supporter = Supporter.find(params[:id])
		@user = @supporter.user
		respond_to do |format|
		  if @supporter.update(supporter_params)
		    format.html { redirect_to user_supporters_path(@user), notice: 'Supporter was successfully updated.' }
		    # format.json { render :show, status: :created, location: @supporter }
		  else
		    format.html { render :new }
		    # format.json { render json: @supporter.errors, status: :unprocessable_entity }
		  end
		end
	end

	def show
		@supporter = Supporter.find(params[:id])
		@user = User.find(params[:user_id])
	end

	def destroy
		@user = User.find(params[:user_id])
		supporter = Supporter.find(params[:id])
		supporter.destroy
		respond_to do |format|
			format.json { return render json: {status: "[x] DESTROYED"} }
			format.html { return redirect_to user_supporters_path(@user) }
		end
	end

	private

	def supporter_params
		params.require(:supporter).permit(:first_name, :last_name, :gmail, :phone, :twitter)
	end
end