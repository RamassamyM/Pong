require 'gosu'
require_relative 'player'
require_relative 'ball'
require_relative 'ui'
require_relative 'song'


module ZOrder
  BACKGROUND, PLAYER, BALL, UI = *0..3
end

class Tutorial < Gosu::Window
  def initialize
    super 640, 480, fullscreen: true
    self.caption = "Tutorial Game"
    sets = [["p3", "t1", 20, "redpad"], ["p2", "charles", 50, "lewagon"], ["p1", "y3", 20, "redpad"]]
    set = sets.sample
    dist = set[2]
    @background_image = Gosu::Image.new("media/#{set[0]}.jpg", tileable: true)
    @player1 = Player.new("media/#{set[3]}.png", 90)
    @player1.warp(40, 240)
    @player2 = Player.new("media/#{set[3]}.png", -90)
    @player2.warp(600, 240)
    @ball = Ball.new("media/#{set[1]}.png", dist)
    @game_over = false
    @win_set = false
    @set_winner = "1"
    @ui = Ui.new(100, 450)
    @song_player = SongPlayer.new
    @song_player.play(Song::Level1)
  end

  def track_move
    if (Gosu.button_down? Gosu::KB_DOWN)
      @player2.down
    end
    if (Gosu.button_down? Gosu::KB_UP)
      @player2.up
    end
    if (Gosu.button_down? Gosu::KB_X)
      @player1.down
    end
    if (Gosu.button_down? Gosu::KB_S)
      @player1.up
    end
  end

  def update_ball
    @ball.touch_player(@player1)
    @ball.touch_player(@player2)
    @ball.touch_wall
    @ball.accelerate
    @ball.move
  end

  def update_player
    @player1.update_score_if_win_the_set(@ball)
    @player2.update_score_if_win_the_set(@ball)
    @player1.move
    @player2.move
  end

  def update
    if @player1.win? || @player2.win?
      @game_over = true
      @song_player.play(Song::GameOver)
    end
    if @game_over && (Gosu.button_down? Gosu::KB_SPACE)
      reset
    end
    if @game_over
      @ball.reset
      return
    end
    if @player1.just_win_set?
      @set_winner = "1"
      @ball.reset
      @win_set = true
      return
    elsif @player2.just_win_set?
      @set_winner = "2"
      @ball.reset
      @win_set = true
      return
    else
      @win_set = false
    end
    track_move
    update_ball
    update_player
  end

  def draw
    @background_image.draw(0, 0, 0)
    @player1.draw
    @player2.draw
    @ball.draw
    @ui.draw(game_state)
  end

  def game_state
    {
      score_player1: @player1.score,
      score_player2: @player2.score,
      win_set: @win_set,
      set_winner: @set_winner,
      game_over: @game_over,
    }
  end

  def reset
    @player1.warp(40, 240)
    @player1.reset
    @player2.warp(600, 240)
    @player2.reset
    @game_over = false
    @ball.reset
  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end

print `clear`
puts "*" * 60
puts "Welcome to this amazing pong game with 2 players !!!"
puts "*" * 60
puts "\n\n"
puts "Player 1 or the left will play with S and X keys."
puts "Player 2 on the right will play with arrow up and arrow down keys."
puts "Press 'Enter' to start"
gets.chomp
Tutorial.new.show
