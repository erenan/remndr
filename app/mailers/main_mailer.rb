class MainMailer < ActionMailer::Base
  default from: "just@remnd.it"
  
  def welcome_email(mail)
    @mail=mail
    mail(to: @mail, subject: 'Greetings from ReMND.it')
  end


end
