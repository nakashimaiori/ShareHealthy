class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts =@user.posts.page(params[:page]).reverse_order.order(id: "DESC")
    #一応これなら表示される↓
    # @day_weights = current_user.day_weights
     @favorite_posts = @user.favorite_posts.page(params[:page]).reverse_order.order(id: "DESC")
     start_time = params[:start_time]
     if start_time.nil?
       start_time = Date.today
     end
     @day_weights = DayWeight.where(user_id: params[:id]).where(start_time: start_time.in_time_zone.all_month)
     @day_records = DayRecord.where(user_id: params[:id]).where(start_time: start_time.in_time_zone.all_month)
     @weights = current_user.day_weights

    # chat
    @currentUserEntry=UserRoom.where(user_id: current_user.id)
    @userEntry=UserRoom.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @user_room = UserRoom.new
      end
    end

    # @chatroom = @userEntry.all


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

  def follows
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
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

  def favorite
    @user = User.find(params[:id])
    @favorite_posts = @user.favorite_posts.page(params[:page]).reverse_order.order(id: "DESC")
  end

  def mychat
    @user = User.all
    user = current_user

    @currentUserEntry=UserRoom.where(user_id: current_user.id)
    @userEntry=UserRoom.where(user_id: @user)

    unless @user == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @roomId = cu.room_id
          end
        end
      end
    end

    @nowchat = Chat.where(user_id: current_user.id).group(:room_id).order(updated_at: :desc)
    @gest = Chat.where(room_id: 6).group(:user_id).pluck(:user_id)[1]
    # binding.pry

  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :old, :sex, :weight, :tall, :target, :introduction)
  end

end
