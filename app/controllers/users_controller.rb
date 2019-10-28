class UsersController < ApplicationController
  def show
    # @user = User.first
    @user = User.find(params[:id])
    # debugger
    # app/views/users/show.html.erb
  end  
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      #success
      flash[:success] = "flash.eachのkey :success value: welcome to ~~~~"
      redirect_to @user
    else
      #failure
      render 'new'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
  end
end