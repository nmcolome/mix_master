class Artists::SongsController < ApplicationController

  def index
    @artist = Artist.find(params[:artist_id])
    @songs = @artist.songs
    session[:return_to] = request.fullpath
    # session[:return_to] ||= request.referer
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:artist_id])
    @song = Song.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:artist_id])
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_id)
  end
end