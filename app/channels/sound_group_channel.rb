class SoundGroupChannel < ApplicationCable::Channel
  def subscribed
    sound_group = SoundGroup.find(params[:id])
    # stream_from "sound_group_#{params[:id]}"
    stream_for sound_group
  end

  # def receive(data)
  #   ActionCable.server.broadcast("sound_group_#{params[:id]}", data)
  # end
end
