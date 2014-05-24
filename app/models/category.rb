class Category < ActiveRecord::Base
validates :name, :user_id, presence: true

	belongs_to :user
	has_many :links
	has_many :reminders #Not currently used, base for V2.0

	#Retrieves the categories associated with a specific user
	def self.user_categories(user)
		where('user_id = ?', user).order('created_at').reverse_order
	end

end
