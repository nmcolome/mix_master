class SongsController < ApplicationController

  def show
    @song = Song.find(params[:id])
    @artist = @song.artist
  end
end