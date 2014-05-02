class Link < ActiveRecord::Base

belongs_to :user

def self.user_links(user)
	where('user_id = ?', user)
end

end
