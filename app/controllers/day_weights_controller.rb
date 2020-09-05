class DayWeightsController < ApplicationController
  # before_action :set_user

  def index
  	@day_weights = current_user.day_weights
  end

  def show
    @user_id = current_user.id
    @user = User.find(params[:id])
  	#@day_weight = current_user.day_weights.find(params[:id])
  end

  def new
  	@day_weights = current_user.day_weights
  end

  def edit
  	@day_weight = current_user.day_weights.find(params[:id])
  end

  def update
  	@day_weight = current_user.day_weights.find(params[:id])
  	@day_weight.update(update_params)
  	redirect_to day_weights_path
  end

  def create
    #@user = User.find(current_user.id)
    @user_id = current_user.id
  	@day_weight = current_user.day_weights.new(weight_memo)
    if @day_weight.save
      redirect_to user_path(current_user.id)
    else
      render action: :new
    end
  end

  def destroy
  end

  private
  def weight_memo
    params.permit(:start_time, :title, :weight, :user_id)
  end

  # def set_user
  #   @user = User.find(params[:id])
  # end

  def update_params
    params.require(:day_weight).permit(:start_time, :weight, :user_id)
  end
end
