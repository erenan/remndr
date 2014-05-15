class MainController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
 
  def index
  	
    if user_signed_in?
      @user=current_user
  		@links = params[:q] ? Link.search_for(params[:q]) : Link.user_links(current_user.id).first(5)
      @categories=Category.user_categories(current_user.id)
  		#@rem=Reminder.user_reminders(current_user.id).first(5) #Currently not used in V1.0 base for reminder function in V2.0

  	end
 
  end

  def links

      @links=Link.user_links(current_user.id)
      @user=current_user

  end

#Currently not used in V1.0 base for reminder function in V2.0
=begin
  def reminders

      @rem=Reminder.user_reminders(current_user.id)

  end
=end

end
