class EmailReceiver < Incoming::Strategies::CloudMailin
require 'mail'

  def receive(mail)
    
    @user=User.first(:conditions => ["email = :query", query: 'edgar@edgarrivera.com'])
    @link = Reminder.new(title: mail.subject, body: mail.body.decoded, user_id: @user.id)
    @link.save
 
    #@link=Link.new
    #@link.title=mail.subject.addresses
    #@link.url=mail.body
    #@link.user_id=1
    #@link.save

  end

end

#req = Rack::Request.new(env)
#result = EmailReceiver.receive(req)