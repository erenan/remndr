#Currently not used in V1.0; base for reminder function in V2.0

class Reminder < ActiveRecord::Base
validates :title, :body, :user_id, presence: true

belongs_to :user
belongs_to :category

	def self.user_reminders(user)
		where('user_id = ?', user).order('created_at').reverse_order
	end

end
