class DayRecordsController < ApplicationController
  def new
    @day_record = DayRecord.new
  end

  def create
    @user_id = current_user.id
    @record = current_user.day_records.new(day_record_params)
    @day_record = current_user.day_records.find_by(start_time: day_record_params[:start_time])
    if @day_record
      @day_record.breakfast += @record.breakfast
      @day_record.lunch += @record.lunch
      @day_record.dinner += @record.dinner
      @day_record.snack += @record.snack
      @day_record.memo += @record.memo
      @day_record.training += @record.training

      @day_record.update(lunch: @day_record.lunch,
                         breakfast: @day_record.breakfast,
                         dinner: @day_record.dinner,
                         snack: @day_record.snack,
                         memo: @day_record.memo,
                         training: @day_record.training)

      redirect_to user_path(current_user.id)
    else @day_record = current_user.day_records.new(day_record_params)
         if @day_record.save
           redirect_to user_path(current_user.id)
         else
           render action: :new
         end
    end
  end

  def show
    @day_record = DayRecord.find(params[:id])
  end

  def edit
    @day_record = DayRecord.find(params[:id])
  end

  def update
    @day_record = current_user.day_records.find(params[:id])
    @day_record.update(day_record_params)
    redirect_to user_day_record_path(current_user.id, @day_record.id)
  end

  def destroy
    @day_record = DayRecord.find(params[:id])
    @day_record.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def day_record_params
    params.require(:day_record).permit(:start_time,
                                       :memo,
                                       :user_id,
                                       :breakfast,
                                       :lunch,
                                       :dinner,
                                       :snack,
                                       :training)
  end
end
