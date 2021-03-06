#Main controller for Links (called Notes in the app)

class LinksController < ApplicationController
  before_action :authenticate_user! #user needs to be loged in to use any of the methods below

  #Shows the selected link
  def show

    @link=Link.find(params[:id])

  end

  #Selects link to edit
  def edit

    @link=Link.find(params[:id])

  end

  #updates the link with the info passed from the form via strong params below
  def update

      @link = Link.find(params[:id])
      @link.update_attributes(link_params.merge(user_id: current_user.id))

      if @link.save
         redirect_to :root
      else
       render :new
      end

  end

  #Destroys the selected link
  def destroy
		@link=Link.find(params[:id])

		if @link.user.id == current_user.id
			@link.destroy
			redirect_to :back
		else
			flash[:notice] = "That is not your link! Cannot delete"
			redirect_to :back
		end

	end

  #Creates a new link
	def new
   	 	@link = Link.new
  end

  #Updates the link with the information received from the form via strong params below
  def create
   		 @link = Link.new(link_params.merge(user_id: current_user.id))

    	if @link.save
       	 redirect_to :root
    	else
     	 render :new
    	end
  end

 	private

  #Sanitizes the params that can be received from the POST request generated by the forms  
  def link_params
  	  params.require(:link).permit(:title, :url, :category_id, :body, :user_id)
  end


end
