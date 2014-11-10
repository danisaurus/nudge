class SupportersController < ApplicationController
	include UsersHelper

	def index
		@user = curent_user
		@supporters = @user.supporters
	end

	def new
		@user = curent_user
		@supporter = Supporter.new(user: @user)
	end

	def create
		@user = curent_user
		@supporter = Supporter.new(supporter_params)
		@supporter.user = @user
		respond_to do |format|
		  if @supporter.save
		    format.html { redirect_to user_supporters_path(@user), notice: 'Supporter was successfully created.' }
		  else
		    format.html { render :new }
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
		  else
		    format.html { render :new }
		  end
		end
	end

	def show
		@supporter = Supporter.find(params[:id])
		@user = curent_user
	end

	def destroy
		supporter = Supporter.find(params[:id])
		@user = supporter.user
		supporter.destroy
		respond_to do |format|
			format.json { return render json: {notice: "Removed #{supporter.first_name} from your circle."} }
			format.html { return redirect_to user_supporters_path(@user) }
		end
	end

	private

	def supporter_params
		params.require(:supporter).permit(:first_name, :last_name, :gmail, :phone, :twitter)
	end
end