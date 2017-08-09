class TracksController < ApplicationController
  before_action :require_logged_in

  def index
    @track = Track.all
  end

  def show
    @track = Track.find(params[:id])
  end

  def new
    @track = Track.new
    render :new
  end

  def create
    p params[:track][:attachment].inspect
    data = params[:track][:attachment].read
    p params[:track][:data].inspect
    name = params[:track][:name]
    artist = params[:track][:artist]
    @track = Track.new(
      channel1: data,
      name: name,
      artist: artist)
    if @track.save
      # redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def destroy
    @track = Track.find(params[:id])
  end

  def stream
    audio = Track.find(params[:id])
    if audio
      send_file audio.path
    end
  end

  private

  def sound_group_params
    params.require(:track).permit(:name, :artist)
  end

end
