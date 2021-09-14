class SessionsController < ApplicationController
  respond_to :html, :json
  def new
  end
  
  def create
    user = User.find_by(email: params[:email].downcase)
    
    respond_with(user) do |format|
      if user && user.authenticate(params[:password])
        create_session(user)
        format.html { redirect_to root_path, notice: "Welcome, #{user.name}!" }
      else
        flash.now[:alert] = "Invalid email/password combination."
        format.html { render :new }
      end
    end
  end
  
  def destroy
    destroy_session(current_user)
    redirect_to root_path, notice: "You've been signed out, come back soon!"
  end
end
