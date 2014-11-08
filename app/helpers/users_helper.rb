module UsersHelper

	def authenticated?
	  session[:user_id]
	end

	def current_user
	  @current_user ||= User.find(session[:user_id])
	end

	def check_session
	  unless authenticated?
	    redirect_to root_url
	  end
	end

end
