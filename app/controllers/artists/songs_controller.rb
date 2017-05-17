class Artists::SongsController < ApplicationController

  def index
    @artist = Artist.find(params[:artist_id])
    @songs = @artist.songs
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

  private

  def song_params
    params.require(:song).permit(:title, :artist_id)
  end
end