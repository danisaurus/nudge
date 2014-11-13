class WelcomeController < ApplicationController
	
	skip_before_filter :authorize

def index
	@user = User.new
end

end