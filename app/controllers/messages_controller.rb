class MessagesController < ApplicationController
before_filter :authenticate_user!

  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def edit
    @message = Message.find(params[:id])
  end

  def sent
  end

  def create
    @message = Message.new(params[:message])

    # put your own credentials here
    account_sid = 'AC6dbef79a33674a248931291708b2a39d'
    auth_token = '655cbb8ba1efbe04332f367f5f10b5b5'
    
    # set up a client to talk to the Twilio REST API
    @client = ::Twilio::REST::Client.new account_sid, auth_token
    
    # send an sms
    @response= @client.account.sms.messages.create(
      :from => '+14155992671',
      :to => @message.phone,
      :body => @message.message 
    )
    ap @response.inspect

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
