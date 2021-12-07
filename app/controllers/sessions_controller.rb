class SessionsController<ApplicationController
	before_action :logged_in_redirect, only: [:new, :create]
	def new

	end
	def create
	user = User.find_by(username: params[:session][:username])
	if user
		session[:user_id] = user.id
		redirect_to root_path
	else
		render 'new'
	end
	end

	def destroy
		session[:user_id] = nil
		
		redirect_to login_path
	end
	private
	def logged_in_redirect
		if logged_in?
			flash[:error] = "already logged in"
			redirect_to root_path
		end
	end
end