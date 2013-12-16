class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to user_url(user.id)
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
  
  def failure
    redirect_to root_url, notice: params[:message]
  end
end