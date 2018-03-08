class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def index
    @users = User.where(activated: true).paginate(page: params[:page], :per_page => 12)
  end

  def show
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user.activated?
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
    end

    # Before filters

end