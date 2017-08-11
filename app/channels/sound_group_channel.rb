class SoundGroupChannel < ApplicationCable::Channel
  def subscribed
    sound_group = SoundGroup.find(params[:id])
    stream_from sound_group
  end
end
