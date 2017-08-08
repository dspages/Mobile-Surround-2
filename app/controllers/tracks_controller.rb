class TracksController < ApplicationController
  before_action :require_logged_in

  def index
    @sound_groups = SoundGroup.all
  end

  def show
    @sound_group = SoundGroup.find(params[:id])
  end

  def new
  end

  def create
    @data = params
    @sound_group = SoundGroup.new(sound_group_params)
    if @sound_group.save
      redirect_to sub_url(@sound_group)
    else
      flash.now[:errors] = @sound_group.errors.full_messages
      render :new
    end
  end

  def destroy
    @sub = SoundGroup.find(params[:id])
  end

  private

  def sound_group_params
    params.require(:sound_group).permit(:title, :artist)
  end

end
