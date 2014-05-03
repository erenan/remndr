class EmailReceiver < Incoming::Strategies::CloudMailin
  
  def receive(mail)
    %(Got message from #{mail.to.first} with subject "#{mail.subject}")
  end

end

req = Rack::Request.new(env)
result = EmailReceiver.receive(req)