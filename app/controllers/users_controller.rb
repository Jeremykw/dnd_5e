class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.invalid?
      flash[:notice] = @user.errors.full_messages
      redirect_to new_user_path(user_params)
    else
      session[:authorized_user_id] = @user.id
      flash[:notice] = "Welcome #{@user.first_name}, you are now logged in"
      redirect_to characters_path
    end    
  end

  def login
    # TO USER LOG IN FORM
  end

  def attempt_login
    if user_params[:email].present? && user_params[:password].present?
      if found_user = User.find_by_email(user_params[:email])
        authorized_user = found_user.authenticate(user_params[:password])
      end
    end
    if authorized_user
      session[:authorized_user_id] = authorized_user.id
      session[:namn] = authorized_user.first_name
      session[:email] = authorized_user.email 
      flash[:notice] = "Welcome #{found_user.first_name}, you are now logged in"
      redirect_to characters_path and return
    else
      flash[:notice] = "Sorry, invalid Email Address or Password"
      redirect_to login_path and return
    end
  end

  def logout
    session[:authorized_user_id] = nil
    session[:namn] = nil
    session[:email] = nil
    flash[:notice] = "You have logged out"
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end