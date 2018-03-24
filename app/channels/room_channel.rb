class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params['room_id']}"
    stream_for "room_channel_#{params['room_id']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
      Message.create!(content: data['message'], room: Room.find(params['room_id']), user_id: data['user_id'], company_id: data['company_id'])
  end
end
