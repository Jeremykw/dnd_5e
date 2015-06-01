class UsersController < ApplicationController
  
  def edit
    @user = User.find(id_params) if User.exists?(id_params)
  end

  def update
    if @user = User.find(id_params)
      unless @user.update(user_params)
        flash[:notice] = @user.errors.full_messages
        redirect_to edit_user_path(id_params)
      else
        flash[:notice] = "#{@user.first_name.capitalize} has been updated"
        set_user_session(@user)
        redirect_to root_path
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.invalid?
      flash[:notice] = @user.errors.full_messages
      redirect_to new_user_path(user_params)
    else
      set_user_session(@user)
      flash[:notice] = "Welcome #{@user.first_name}!"
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
      set_user_session(authorized_user)
      flash[:notice] = "Welcome #{found_user.first_name}, you are now logged in"
      redirect_to characters_path and return
    else
      flash[:notice] = "Sorry, invalid Email Address or Password"
      redirect_to login_path and return
    end
  end

  def logout
    set_user_session(nil)
    flash[:notice] = "You have logged out"
    redirect_to login_path
  end

  def delete
    @user = User.find(id_params)
    if @user.destroy
      flash[:notice] = "#{@user.first_name} has been Deleted"
      set_user_session(nil) 
      redirect_to login_path and return
    else
      flash[:notice] = "#{@user.first_name} was not Deleted"
      redirect_to edit_user_path(id_params)
    end
  end

  private

  def set_user_session(user)    
    if user
      session[:authorized_user_id] = user.id
      session[:name] = user.first_name
      session[:email] = user.email
    else
      session[:authorized_user_id] = nil
      session[:name] = nil
      session[:email] = nil
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def id_params
    params.require(:id)
  end

end