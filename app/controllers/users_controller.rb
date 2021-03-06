class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
before_action :require_user , only: [:edit, :update]
before_action :require_same_user, only: [:update, :edit, :destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Gigih Catering #{@user.username}, you have successfully create an account"
      redirect_to foods_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was successfully updated"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def show
    @foods = @user.foods
  end

  def index
    @users = User.all
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:success] = "Account and all of the orders has been deleted"
    redirect_to root_path
  end
end

private
def user_params
  params.require(:user).permit(:username, :email, :password)
end

def set_user
  @user = User.find(params[:id])
end

def require_same_user
  if current_user != @user && !current_user.admin?
    flash[:danger] = "You only can edit or delete your order"
    redirect_to @user
  end
end
