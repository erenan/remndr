scheduler = Rufus::Scheduler.new

scheduler.every('1m') do

	User.all do |u|
	
		if u.mail_send = 1
	    	MainMailer.summary_email(u).deliver
	    end

	end

end 

#'35 23 * * *'