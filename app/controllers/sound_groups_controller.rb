class SoundGroupsController < ApplicationController

  before_action :require_logged_in

  def index
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

  def play
    @sound_group = SoundGroup.find(params[:id])
    p @sound_group
    p "play"
    SoundGroupChannel.broadcast_to(@sound_group, message: "play")
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
