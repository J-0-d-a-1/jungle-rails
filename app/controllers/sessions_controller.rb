class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully!"
    else
      redirect_to sessions_new_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to sessions_new_path, notice: "Logged out successfully."
  end
end
