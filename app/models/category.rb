class Category < ActiveRecord::Base
validates :name, :user_id, presence: true

	belongs_to :user
	has_many :links
	has_many :reminders

end
