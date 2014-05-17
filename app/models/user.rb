class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :links
has_many :reminders
has_many :messages
has_many :categories


	#Looks for the user based on e-mail address
	def self.which_one(query)

		first(:conditions => ["email = :query", query: query])
			
	end


end
