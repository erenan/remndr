require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.cron '5 6 * * *' do

	@users=User.all
	
	@users.each do |u|
	#u=User.find(1)
		if u.mail_send == 1
	    	MainMailer.summary_email(u).deliver
	    end

	end

end 

#'35 23 * * *'