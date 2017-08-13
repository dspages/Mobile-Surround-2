class SoundGroupsController < ApplicationController

  before_action :require_logged_in

  def index
    current_user.sound_group_id = -1
    @sound_groups = SoundGroup.all
  end

  def show
    current_user.sound_group_id = params[:id]
    @sound_group = SoundGroup.find(params[:id])
    current_user.save
    @users = @sound_group.users
    @tracks = Track.all
  end

  def new
    @sound_group = SoundGroup.new
  end

  def create
    @sound_group = SoundGroup.new(sound_group_params)
    if @sound_group.save
      current_user.sound_group_id = @sound_group
      redirect_to sound_group_url(@sound_group)
    else
      flash.now[:errors] = @sound_group.errors.full_messages
      render :new
    end
  end

  def update
    @sound_group = SoundGroup.find(params[:id])
    @sound_group.update_attributes(sound_group_params)
    SoundGroupChannel.broadcast_to(@sound_group, track: {
    ch1: Track.find(params[:sound_group][:track_id]).channel1,
    ch2: Track.find(params[:sound_group][:track_id]).channel2,
    ch3: Track.find(params[:sound_group][:track_id]).channel3,
    ch4: Track.find(params[:sound_group][:track_id]).channel4,
    ch5: Track.find(params[:sound_group][:track_id]).channel5,
    })
    render json: {}
  end

  def play
    # p params
    @sound_group = SoundGroup.find(params[:id])
    SoundGroupChannel.broadcast_to(@sound_group, scheduled_time:
    params[:time] [:timestamp])
    render json: {}
  end

  def destroy
    @sound_group = SoundGroup.find(params[:id])
  end

  private

  def sound_group_params
    params.require(:sound_group).permit(:name, :leader_id, :track_id)
  end
end
