class RoomsController < ApplicationController
  before_action :load_entities

  def index
    @rooms = Room.all
  end

  def show
    @room_message = RoomMessage.new room: @room
    @room_messages = @room.room_messages.includes(:user)
  end


  protected

  def load_entities
    @rooms = Room.all
    @room = Room.find(params[:id]) if params[:id]
  end
end
