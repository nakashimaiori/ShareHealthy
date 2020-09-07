class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts =@user.posts.page(params[:page]).reverse_order
    #一応これなら表示される↓
    # @day_weights = current_user.day_weights
    # [#<DayWeight id: 19, user_id: 4, weight: 31.6, start_time: "2020-09-03", created_at: "2020-09-06 08:57:12", updated_at: "2020-09-06 08:57:12">, #<DayWeight id: 20, user_id: 4, weight: 30.2, start_time: "2020-09-02", created_at: "2020-09-06 08:59:41", updated_at: "2020-09-06 08:59:41">, #<DayWeight id: 21, user_id: 4, weight: 30.3, start_time: "2020-09-09", created_at: "2020-09-06 09:02:29", updated_at: "2020-09-06 09:02:29">]>
     @favorite_posts = @user.favorite_posts.page(params[:page]).reverse_order
     start_time = params[:start_time]
     if start_time.nil?
       start_time = Date.today
     end
     @day_weights = DayWeight.where(user_id: params[:id]).where(start_time: start_time.in_time_zone.all_month)
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
