class Reminder < ActiveRecord::Base
validates :title, :body, :user_id, presence: true

belongs_to :user

def self.user_reminders(user)
	where('user_id = ?', user).order('created_at')
end

end
