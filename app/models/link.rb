class Link < ActiveRecord::Base
validates :title, :user_id, presence: true #only user and title are required, category, body, url are optional

belongs_to :user
belongs_to :category

    #Retrieves the links associated with a specific user
	def self.user_links(user)
		where('user_id = ?', user).order('created_at').reverse_order
	end

    #Runs a search with the keywords passed through the search box in Index.html.erb
    def self.search_for(query)
        where('title LIKE :query OR body LIKE :query', query: "%#{query}%").order('created_at').reverse_order
    end

end
