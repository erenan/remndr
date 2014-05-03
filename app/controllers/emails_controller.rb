class EmailsController < ApplicationController
before_action :authenticate_user! 

  def create
    if EmailReceiver.receive(request)
      render :json => { :status => 'ok' }, :status => 200
    else
      render :json => { :status => 'rejected' }, :status => 403
    end
  end

end
