class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :allow_CORS 

  def current_user

    if session[:user_id]
      begin
      @current_user = User.find(session[:user_id])

      rescue ActiveRecord::RecordNotFound => e
        session[:user_id] = nil
        redirect_to '/login', :alert => 'Login required to use the system.'
      end
    end
  end
  helper_method :current_user

  def authorize
    redirect_to '/login', :alert => 'Login required to use the system.' unless current_user
  end

  def allow_CORS

    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end
