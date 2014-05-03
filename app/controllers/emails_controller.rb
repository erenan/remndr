class EmailsController < ApplicationController
skip_before_filter :verify_authenticity_token

  def create
    
    @link=EmailReceiver.receive(request)
    if @link.save
    	render :text => 'success', :status => 200
    else
    	render :text => 'Failed :(', :status => 400
    end


  end

end
