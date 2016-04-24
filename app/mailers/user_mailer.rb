class UserMailer < ActionMailer::Base
  default from: ENV['email']
  # before_action :require_login

  def welcome_email(user)
  	@user = user
  	@url = 'http://localhost:3000/'
  	mail(to:@user.email,subject:'Welcome to Mission Checkers')
  	
  end
end
