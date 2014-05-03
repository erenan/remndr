class EmailReceiver < Incoming::Strategies::CloudMailin
  
  def receive(mail)
    
    @link=Link.new
    @link.title=mail.subject
    @link.url=mail.body
    @link.user_id=3
    @link.save

  end

end

#req = Rack::Request.new(env)
#result = EmailReceiver.receive(req)