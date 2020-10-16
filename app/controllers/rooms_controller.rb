class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.create
    @entry1 = UserRoom.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = UserRoom.create(params.permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to "/chats/#{@room.id}"
  end
end
