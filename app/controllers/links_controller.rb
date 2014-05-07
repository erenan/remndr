class LinksController < ApplicationController
  before_action :authenticate_user!

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

	def new
   	 	@link = Link.new
  	end

  	def create
   		 @link = Link.new(link_params.merge(user_id: current_user.id))

    	if @link.save
       	 redirect_to :root
    	else
     	 render :new
    	end
  	end

 	 private
  	
  	def link_params
  	  params.require(:link).permit(:title, :url, :user_id)
 	  end


end
