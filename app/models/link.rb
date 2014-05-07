class Link < ActiveRecord::Base
validates :title, :url, :user_id, presence: true

belongs_to :user

	def self.user_links(user)
		where('user_id = ?', user).order('created_at').reverse_order
	end

end
