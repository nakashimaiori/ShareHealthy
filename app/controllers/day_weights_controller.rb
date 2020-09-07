class DayWeightsController < ApplicationController
  # before_action :set_user

  def index
  	@day_weights = current_user.day_weights
  end

  def show
    #@user = current_user
    @user = current_user
  	@day_weight = DayWeight.find(params[:id])
  end

  def new
  	@day_weights = current_user.day_weights
  end

  def edit
  	@day_weight = current_user.day_weights.find(params[:id])
  end

  def update
  	@day_weight = current_user.day_weights.find(params[:id])
  	@day_weight.update(w)
  	redirect_to user_path(current_user.id)
  end

  def create
    @user_id = current_user.id
  	@day_weight = current_user.day_weights.new(weight_memo)
    # @now = current_user.day_weights.find_by(@day_weight_id)
    #   if @now
    #     @now.update(weight_memo)
    #     redirect_to user_path(current_user.id)
    #   else
        if @day_weight.save
          redirect_to user_path(current_user.id)
        else
          render action: :new
        end
      # end
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

  # def set_user
  #   @user = User.find(params[:id])
  # end
  # weight: @now.weight

  def day_weight_params
    params.require(:day_weight).permit(:start_time, :weight, :user_id)
  end
end




# @day_weight = DayWeight.find_or_initialize_by(group_no: day_weight_params[:group_no])
# if @day_weight.new_record?
#   @day_weight = current_user.day_weights.new(weight_memo)
#   @day_weight.save!
# else
#   @day_weight(weight_memo)
# end

