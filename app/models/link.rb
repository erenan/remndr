class Link < ActiveRecord::Base
validates :title, :user_id, presence: true

belongs_to :user
belongs_to :category

	def self.user_links(user)
		where('user_id = ?', user).order('created_at').reverse_order
	end

   def self.search_for(query)
        where('title LIKE :query OR body LIKE :query', query: "%#{query}%")
   end

end
