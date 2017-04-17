class Player
  attr_reader :x, :y, :vel, :score

  WinSetPause = 2000

  def initialize(media, angle)
    @image = Gosu::Image.new(media)
    @x = @y = 0.0
    @angle = angle
    reset
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def down
    @vel = 1
  end

  def up
    @vel = -1
  end

  def update_score_if_win_the_set(ball)
    if (@x < 320 && ball.x > 630) || (@x > 320 && ball.x < 10)
    @score = score + 1
    @win_set_at = Gosu::milliseconds
    end
  end

  def just_win_set?
    Gosu::milliseconds - @win_set_at < WinSetPause
  end

  def win?
    @score == 3
  end

  def move
    @y += @vel * 8
    @y = 450 if @y >= 450
    @y = 30 if @y <= 30
    @vel *= 0.60
  end

  def reset
    @vel = 0
    @score = 0
    @win_set_at = -20_000
  end

  def draw
    @image.draw_rot(@x, @y, 2, @angle)
  end
end
