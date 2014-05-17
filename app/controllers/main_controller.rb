class MainController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create] #Autenticates user before using create or new, currently not in use, moved new and create to its own controllers
 
  #Gets the info to render in the main/landing page
  def index
  	
    if user_signed_in?
      @user=current_user
  		@links = params[:q] ? Link.search_for(params[:q]) : Link.user_links(current_user.id).first(5) #by default it calls the latest 5 Links, alternatively it retrieves the results of a search
      @categories=Category.user_categories(current_user.id)
  		#@rem=Reminder.user_reminders(current_user.id).first(5) #Currently not used in V1.0 base for reminder function in V2.0

  	end
 
  end

  #Looks for all of the links from the user to display them
  def links

      @user=current_user
      @links=Link.user_links(current_user.id)

  end

  #Looks for all of the links from the user to display them, but orders them from older to more recent
  def old_links

      @user=current_user
      @links=Link.old_user_links(current_user.id)

  end

#Currently not used in V1.0 base for reminder function in V2.0
=begin
  def reminders

      @rem=Reminder.user_reminders(current_user.id)

  end
=end

end
