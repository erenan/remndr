class EmailsController < ApplicationController
skip_before_filter :verify_authenticity_token

  def create
    EmailReceiver.receive(request)
      redirect_to :root

  end

end
