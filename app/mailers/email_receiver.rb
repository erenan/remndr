class EmailReceiver < Incoming::Strategies::CloudMailin
  
  def receive(mail)
    
    Link.new(title: mail.subject, url: 'http://test.com', user_id: 1)

    #@link=Link.new
    #@link.title=mail.subject
    #@link.url=mail.body
    #@link.user_id=1
    #@link.save

  end

end

#req = Rack::Request.new(env)
#result = EmailReceiver.receive(req)