class RoomChannel < ApplicationCable::Channel
  def subscribed
    if params.present? && params[:room] > 0
      room = Room.find params[:room]
      stream_for room
    end  
  end
end