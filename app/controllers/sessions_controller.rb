class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/', :notice => 'You are logged correctly.'
    else
      # If user's login doesn't work, send them back to the login form.
      redirect_to '/login', :alert => 'The username or password are invalid.'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', :notice => 'Thanks for use the system.'
  end
end

