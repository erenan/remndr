task :send_daily_summary => :environment do

	@users=User.all
	
	@users.each do |u|
	#u=User.find(1)
		if u.mail_send == 1
	    	MainMailer.summary_email(u).deliver
	    else
	    end

	end

end