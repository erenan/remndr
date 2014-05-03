class EmailReceiver < Incoming::Strategies::CloudMailin
  
  def receive(mail)
    
    @link=Link.new
    @link.title=mail.subject
    @link.url=mail.body
    @link.user_id=current_user.id
    @link.save

  end

end

#req = Rack::Request.new(env)
#result = EmailReceiver.receive(req)