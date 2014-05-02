class RemindersController < ApplicationController

	def destroy

		@rem=Reminder.find(params[:id])
		@rem.destroy
		redirect_to :back

	end

end
