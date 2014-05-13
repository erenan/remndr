#Currently not used in V1.0; base for reminder function in V2.0

class RemindersController < ApplicationController
before_action :authenticate_user!

	def destroy
		@rem=Reminder.find(params[:id])

		if @rem.user.id == current_user.id
			@rem.destroy
			redirect_to :back
		else
			flash[:notice] = "That is not your note! Cannot delete"
			redirect_to :back
		end
		
	end

	def new
   	 	@rem = Reminder.new
  	end

  	def create
   		 @rem = Reminder.new(note_params.merge(user_id: current_user.id))

    	if @rem.save
       	 redirect_to :root
    	else
     	 render :new
    	end
  	end

 	 private
  	
  	def note_params
  	  params.require(:reminder).permit(:title, :body, :remind_date, :expire_date, :user_id)
 	end





end
