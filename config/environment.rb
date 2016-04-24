# Load the Rails application.
require File.expand_path('../application', __FILE__)
ActionMailer::Base.smtp_settings = {
   :address              => "smtp.gmail.com",
   :port                 => 587,
   :user_name            => 'Mission Checker Team',
   :password             => ENV['pass'],
   :authentication       => "plain",
  :enable_starttls_auto => true
}

# Initialize the Rails application.
Rails.application.initialize!
