require 'date'
require 'time'

class SessionsController < ApplicationController
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user[:id]
      redirect_to "/dashboard"
    else
      flash[:danger] = @user.errors.full_messages
      redirect_to '/signup'
    end
    
  end
  
  def login

    @user = User.find_by_email(params[:email].downcase)

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user[:id]
      redirect_to "/dashboard"
    else
      flash[:notice] = "Invalid username and/or password"
      redirect_to "/"
    end

  end
  
  
  def logout
    session.clear
    flash[:notice] = "You have successfully logged out"
    redirect_to "/"
  end
  
  private

  def user_params
    
    birthday = Time.parse(params[:user][:dob]).utc
    
    if birthday > Time.current
      flash[:notice] = "Date of birth cannot be future date!"
    end
    
    params.require(:user).permit(:first_name, :last_name, :email, :dob, :username, :password, :password_confirmation)
    
  end
  
  # def dob_params
  #   # binding.pry
  #   birthday = params[:user][:dob]
  #   birthday < Time.current
  # end
end
