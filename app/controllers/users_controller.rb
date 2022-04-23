class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Gigih Catering #{@user.username}, you have successfully create an account"
      redirect_to foods_path
    else
      render 'new'
    end

  end
end

private
def user_params
  params.require(:user).permit(:username, :email, :password)
end
