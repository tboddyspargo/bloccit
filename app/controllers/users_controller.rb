class UsersController < ApplicationController
  respond_to :html, :json
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.visible_to(current_user)
    respond_with @user
  end
  
  def new
    @user = User.new
    respond_with @user, location: root_path
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    
    if @user.save
      flash[:notice] = "Welcome to Bloccit #{@user.name}!"
      create_session(@user)
    else
      flash.now[:alert] = "There was an error creating your account. Please try again."
    end
    respond_with @user, location: root_path
  end
end
