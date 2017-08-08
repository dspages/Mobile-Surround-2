class TracksController < ApplicationController
  # before_action :require_logged_in

  def index
    @track = Track.all
  end

  def show
    @track = Track.find(params[:id])
  end

  def new
    render :new
  end

  def create
    data = params.track.data
    title = params.track.title
    artist = params.track.artist
    @track = Track.new(
      channel1: data,
      title: title,
      artist: artist)
    if @track.save
      redirect_to sub_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def destroy
    @track = Track.find(params[:id])
  end

  private

  def sound_group_params
    params.require(:track).permit(:title, :artist)
  end

end
