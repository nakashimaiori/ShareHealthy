class DayWeightsController < ApplicationController

  def index
  	@day_weights = current_user.day_weights
  end

  def show
    #@user = current_user
    @user = current_user
  	@day_weight = DayWeight.find(params[:id])
  end

  def new
    @day_weight = DayWeight.new
  end

  def edit
  	@day_weight = current_user.day_weights.find(params[:id])
  end

  def update
  	@day_weight = current_user.day_weights.find(params[:id])
  	@day_weight.update(day_weight_params)
  	redirect_to user_path(current_user.id)
  end

  def create
    @user_id = current_user.id
    # @day_weight = current_user.day_weights.find_by(user_id: current_user.id, start_time: params[:id])
    @day_weight = current_user.day_weights.where(user_id: params[:id]).find_by(start_time: params[:start_time])
    # @day_weight = current_user.day_weights.pluck(:start_time)
    if @day_weight
      @day_weight.update(day_weight_params)
      redirect_to user_path(current_user.id)
    else
      @day_weight = current_user.day_weights.new(day_weight_params)
      if @day_weight.save
        redirect_to user_path(current_user.id)
      else
        render action: :new
      end
    end
  end

  def destroy
    @day_weight = DayWeight.find(params[:id])
    @day_weight.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def weight_memo
    params.permit(:start_time, :title, :weight, :user_id)
  end

  def day_weight_params
    params.require(:day_weight).permit(:start_time, :weight, :user_id)
  end
end



