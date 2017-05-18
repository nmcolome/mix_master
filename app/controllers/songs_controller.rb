class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
    @artist = @song.artist
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    redirect_to session.delete(:return_to)
  end
end