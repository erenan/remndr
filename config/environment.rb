# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rmndr::Application.initialize!

ActionMailer::Base.delivery_method = :smtp


#THIS IS THE EMAIL IMPLEMENTATION
ActionMailer::Base.smtp_settings = {
  :address              => 'smtp.office365.com',
  :port                 => 25,
  :user_name            => ENV["GODADDY_USERNAME"],
  :password             => ENV["GODADDY_PASSWORD"],
 :authentication       => :login  
}


