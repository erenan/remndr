class RemindersController < ApplicationController
before_action :authenticate_user!

	def destroy

		@rem=Reminder.find(params[:id])
		@rem.destroy
		redirect_to :back

	end





end
