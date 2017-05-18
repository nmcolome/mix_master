class SongsController < ApplicationController

  def index
    @songs = Song.all
    session[:return_to] = request.fullpath
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