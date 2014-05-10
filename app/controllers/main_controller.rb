class MainController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
 
  def index
  	
    if user_signed_in?
  		@links=Link.user_links(current_user.id).first(5)
  		@rem=Reminder.user_reminders(current_user.id).first(5)
      @user=current_user
  	end
 
  end

  def links

      @links=Link.user_links(current_user.id)

  end

  def reminders

      @rem=Reminder.user_reminders(current_user.id)

  end

end
