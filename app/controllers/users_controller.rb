class UsersController < ApplicationController
  before_action :select_user, except: [:new, :create, :index]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account created "
      redirect_to user_path(@user)
    else
      render "new"
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = "Account was successfully updated"
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  def show; end

  def index
    @users = User.all
  end

  def destroy
    @user.destroy
    flash[:danger] = "Account was successfully deleted"
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :description)
  end

  def select_user
    @user = User.find(params[:id])
  end

end
