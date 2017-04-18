class Ball
  attr_reader :x
  def initialize(media, dist)
    @image = Gosu::Image.new(media)
    @beep = Gosu::Sample.new("media/beep2.wav")
    @dist = dist
    reset
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def chang_rot
    @dir *= -1
  end

  def change_horizontal_angle
    @angle = 180 - @angle
  end

  def change_vertical_angle(vel_player)
    if @angle > 0
      @angle = (-1 * @angle) + (vel_player * 20)
    else
      @angle = (-1 * @angle) - (vel_player * 20)
    end
  end

  def change_speed(vel_player)
    if (@angle.abs >= 0 && @angle.abs < 90 && vel_player < 0) || (@angle.abs >= 90 && @angle.abs < 180 && vel_player > 0)
      @vel += vel_player.abs * 0.3
      @vel_rot += vel_player * 0.3
    else
      @vel -= vel_player.abs * 0.3
      @vel_rot -= vel_player * 0.3
      chang_rot
    end
  end

  def move
    @rot += @dir * @vel_rot
    @x += Gosu.offset_x(@angle, 2 + @vel)
    @y += Gosu.offset_y(@angle, 2 + @vel)
  end

  def accelerate
    @vel += 0.005
    @vel_rot += 0.001
  end

  def touch_wall
    if @y <= 20 || @y >= 460
      change_horizontal_angle
    end
  end

  def reset
    @x = 320
    @y = 240
    @angle = [-60, 60, -80, 80, -100, 100, -120, 120].sample
    @dir = 1
    @vel = 0
    @vel_rot = 5
    @rot = 0
  end

  def check_touch?(player)
    (Gosu.distance(@x, @y, player.x, player.y) < @dist) || (Gosu.distance(@x, @y, player.x, player.y + 25) < @dist - 10) || (Gosu.distance(@x, @y, player.x, player.y - 25) < @dist - 10)
  end

  def touch_player(player)
    if check_touch?(player)
      change_speed(player.vel)
      change_vertical_angle(player.vel)
      @beep.play
    end
  end

  def draw
    @image.draw_rot(@x, @y, 3, @rot)
  end
end
