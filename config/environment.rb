# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rmndr::Application.initialize!

ActionMailer::Base.delivery_method = :smtp


#THIS WILL BE THE EMAIL IMPLEMENTATION
ActionMailer::Base.smtp_settings = {
  :address              => 'smtpout.secureserver.net',
  :port                 => 25,
  :user_name            => 'just@remnd.it',
  :password             => 'jinxed62!',
  :authentication       => :login  
}


