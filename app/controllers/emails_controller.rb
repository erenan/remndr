class EmailsController < ApplicationController

  def create
    if EmailReceiver.receive(request)
      redirect_to :root
      #render :json => { :status => 'ok' }, :status => 200
    else
      redirect_to :root
      #render :json => { :status => 'rejected' }, :status => 403
    end
  end

end
