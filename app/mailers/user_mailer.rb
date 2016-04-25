class UserMailer < ActionMailer::Base
  default from: ENV['email']
  # before_action :require_login

  def welcome_email(user)
  	@user = user
  	@url = 'http://localhost:3000/'
  	mail(to:@user.email,subject:'Welcome to Mission Checkers')
  	
  end

  def send_mission(mission,c)
  	@mission = mission
  	@num = c
  	@url = "http://localhost:3000/missions/#{mission.id}/edit"
  	mail(to:@mission.user.email,subject:"It's time to check your Mission!---#{mission.title}")
  	
  end
end
