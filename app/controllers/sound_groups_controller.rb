class SoundGroupsController < ApplicationController

  before_action :require_logged_in

  def index
    @sound_groups = SoundGroup.all
  end

  def show
    @sound_group = SoundGroup.find(params[:id])
    current_user.sound_group_membership = @sound_group
  end

  def new
  end

  def create
    @sound_group = SoundGroup.new(sound_group_params)
    if @sound_group.save
      current_user.sound_group_membership = @sound_group
      redirect_to sub_url(@sound_group)
    else
      flash.now[:errors] = @sound_group.errors.full_messages
      render :new
    end
  end

  def destroy
    @sound_group = SoundGroup.find(params[:id])
  end

  private

  def sound_group_params
    params.require(:sound_group).permit(:name, :leader_id, :track_id)
  end
end
