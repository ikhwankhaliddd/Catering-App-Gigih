class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Login successfully"
      redirect_to user
    else
      flash[:danger] = "Wrong email or password"
      render 'new'
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged Out"
    redirect_to root_path
  end
end
