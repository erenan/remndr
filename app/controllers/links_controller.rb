class LinksController < ApplicationController

	def destroy

		@link=Link.find(params[:id])
		@link.destroy
		redirect_to :back

	end

end
