class SessionsController < ApplicationController
  def new
    #@session = Session.new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    # debugger
    if user && user.authenticate(params[:session][:password])
      #Success
      log_in user
      redirect_to user
    else
      #Failure
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
