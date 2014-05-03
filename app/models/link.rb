class Link < ActiveRecord::Base
validates :title, :url, :user_id, presence: true

belongs_to :user

def self.user_links(user)
	where('user_id = ?', user)
end

end
