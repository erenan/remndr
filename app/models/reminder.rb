class Reminder < ActiveRecord::Base

belongs_to :user

def self.user_reminders(user)
	where('user_id = ?', user)
end

end
