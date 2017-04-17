module Song
  GameOver = "media/fin.mp3"
  Level1   = "media/muz.mp3"
end

class SongPlayer
  def play(file)
    @song.stop if @song
    @song = Gosu::Song.new(file)
    @song.volume = 0.25
    @song.play(true)
  end
end
