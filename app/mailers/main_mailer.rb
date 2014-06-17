class MainMailer < ActionMailer::Base
  default from: "just@remnd.it"
  
  def welcome_email(mail)
    @mail=mail
    mail(to: @mail, subject: 'Greetings from ReMND.it')
  end

  def summary_email(user)
  	@user=user
  	@mail=@user.email
  	@date=Date.today-1
  	@links=Link.yesterday_links(@user.id)
  	mail(to: @mail, subject: 'Your ReMND activity summary')

  end


end
