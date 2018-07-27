class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #NOTE rails needs to know the below are helper methods, every controller can access them but views cannot.
  helper_method :current_user, :logged_in?

  def current_user
    #NOTE return the user if session user id is backed by browser if so go find that user in our Database
    #NOTE if @current_user exists return it if not(||=) then go and find it.
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    #NOTE returns true if you have a current user or false if not
    !!current_user
  end

  def require_user
    if not logged_in?
      flash[:danger] = "You must sign logged in to preform that action"
      redirect_to root_path
    end
  end
end
