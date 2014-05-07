class MainController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
 
  def index
  	if user_signed_in?
  		@links=Link.user_links(current_user.id)
  		@rem=Reminder.user_reminders(current_user.id)
  	end
 
  end

  def new

  end

  def create

  end

end
