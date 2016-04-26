class SessionsController < ApplicationController
  def index
    if session[:user_id]
      # reset_session
      redirect_to "/users/#{session[:user_id]}"
    end
  end

  def create
  	email = params[:email]
  	user = User.find_by_email(email)
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to "/users/#{current_user.id}"
  	else
  		flash[:errors] = ['Invalid combination']
  		redirect_to "/sessions"
  	end
  end

  def destroy
  	reset_session
  	redirect_to "/sessions"
  end
end