class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    @user.sound_group_id = -1
    if @user.save
      log_in!(@user)
      render :index
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
