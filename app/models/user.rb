class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :links
has_many :reminders
has_many :messages


	def self.which_one(query)

		first(:conditions => ["email = :query", query: "%#{query}%"])

	end


end
