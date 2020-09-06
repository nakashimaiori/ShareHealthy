class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    #一応これなら表示される↓
    # @day_weights = current_user.day_weights
    start_time = params[:start_time]
    if start_time.nil?
      start_time = Date.today
    end
    @day_weights = DayWeight.where(user_id: params[:user_id]).where(start_time: start_time.in_time_zone.all_month)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to root_path
    end
  end

  def exit
    @user = User.find(current_user.id)
  end

  def withdraw
    @user = User.find(params[:id])
    @user.update(status: "退会済")
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :old, :sex, :weight, :tall, :target, :introduction)
  end

end
