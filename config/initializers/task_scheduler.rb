require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.cron '5 15 * * *' do

=begin
	@users=User.all
	
	@users.each do |u|
	#u=User.find(1)
		if u.mail_send == 1
	    	MainMailer.summary_email(u).deliver
	    end

	end
=end
end 

#'35 23 * * *'