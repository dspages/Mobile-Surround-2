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
    # p params[:track][:attachment].inspect
    # data = params[:track][:attachment].read
    # p params[:track][:data].inspect
    name = params[:track][:name]
    artist = params[:track][:artist]
    @track = Track.new(
      channel1: params[:track][:channel1],
      channel2: params[:track][:channel2],
      channel3: params[:track][:channel3],
      channel4: params[:track][:channel4],
      channel5: params[:track][:channel5],
      name: name,
      artist: artist)
    if @track.save
      redirect_to sound_groups_url
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
    params.require(:track).permit(:name, :artist)
  end

end
