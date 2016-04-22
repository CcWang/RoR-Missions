class UsersController < ApplicationController

  def create
  	@user = User.new(user_params)
    if !@user.save
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
      
    else
      @user.save
      session[:user_id] = @user.id
      redirect_to "/users/#{current_user.id}"
    end
  end

  def show
  	@missions = current_user.missions.order(created_at: :desc)
  end  
  
  private
  def user_params
    params.require(:user).permit(:email,:first_name,:last_name,:phone,:password,:password_confirmation)
  end
end
