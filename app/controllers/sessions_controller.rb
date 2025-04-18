class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
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
