#This is a custom controller that manages the incoming HTTP POST message coming from Cloudmailin

class EmailsController < ApplicationController
require 'uri' #method that looks for URLs inside text
skip_before_filter :verify_authenticity_token #prevents rails from raising an exception as we cannot verify the token

#main method that creates the new Link entry (known as Note in the app)
  def create

#Identify user by her e-mail address
	  @from=params[:headers]['Return-Path']
    @user=User.which_one(@from)

#If user does not exists it acknowledges that the message was received sucessfully but doesn't do anything else
#in V2.0 this will trigger the creation of a "invite" delivered by e-mail so the user can sign up for the service and store the message in a temp folder
    if @user == nil
   		
      MainMailer.welcome_email(@from).deliver

      render :text => 'Received... but user doesn\'t exists', :status => 200

    else

        if parse_link(params[:plain]) == nil #If no link is detected in the body it creates a plain note entry (i.e. w/o clickable title)

          @content=create_note

        else

          @content=create_link  #if a URL is detected the Link entry (called note in the app) has a clickable title

        end
   		
   		  if @content.save #saves content and delivers a success message or a fail message
    			render :text => 'success', :status => 200
    		else
    			render :text => 'Failed', :status => 400
    		end

   	end
   

  end

  def create_link

      @url=parse_link(params[:plain]) #Extracts URL to create clickable title

      Link.new(title: params[:headers]['Subject'], url: @url, body: params[:plain], user_id: @user.id)

  end

  def create_note

      Link.new(title: params[:headers]['Subject'], body: params[:plain], user_id: @user.id)

  end

  def parse_link(raw)

    #extract the first URL form the email body using URI
    @url=URI.extract(raw)
    @url.first
    
=begin Experimenting with better parsing of links
    #extract the first URL form the email body using REGEX
    #source: https://github.com/matthewrudy/regexpert/blob/master/lib/regexpert.rb
    #@url=raw.scan(/(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix)
    #@url.first
=end

  end


end

#Cloudmailin HTTP POST structure
=begin  Rails.logger.info params[:headers] #=> "headers"=>{"Return-Path"=>"from@example.com", "Received"=>{"0"=>"by 10.52.90.229 with SMTP id bz5cs75582vdb; Mon, 16 Jan 2012 09:00:07 -0800", "1"=>"by 10.216.131.153 with SMTP id m25mr5479776wei.9.1326733205283; Mon, 16 Jan 2012 09:00:05 -0800", "2"=>"from mail-wi0-f170.google.com (mail-wi0-f170.google.com [209.85.212.170]) by mx.google.com with ESMTPS id u74si9614172weq.62.2012.01.16.09.00.04 (version=TLSv1/SSLv3 cipher=OTHER); Mon, 16 Jan 2012 09:00:04 -0800"}, "Date"=>"Mon, 16 Jan 2012 17:00:01 +0000", "From"=>"Message Sender <sender@example.com>", "To"=>"Message Recipient <to@example.com>", "Message-ID"=>"<4F145791.8040802@example.com>", "Subject"=>"Test Subject", "Mime-Version"=>"1.0", "Delivered-To"=>"to@example.com", "Received-SPF"=>"neutral (google.com: 10.0.10.1 is neither permitted nor denied by best guess record for domain of from@example.com) client-ip=10.0.10.1;", "Authentication-Results"=>"mx.google.com; spf=neutral (google.com: 10.0.10.1 is neither permitted nor denied by best guess record for domain of from@example.com) smtp.mail=from@example.com", "User-Agent"=>"Postbox 3.0.2 (Macintosh/20111203)"}
  Rails.logger.info params[:headers]['Subject'] #=> "Test Subject"
  Rails.logger.info params[:headers]['To'] #=> "to@example.com"
  Rails.logger.info params[:headers]['From'] #=> "from@example.com"
  Rails.logger.info params[:headers]['From'] #=> "from@example.com"  
  Rails.logger.info params[:plain]
    Rails.logger.info params[:envelope][:from] #=> "from@example.com"
    Rails.logger.info params[:envelope][:helo_domain]
=end