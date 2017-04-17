class Ui
  def initialize(position_score1, position_score2)
    @font = Gosu::Font.new(20)
    @big_font = Gosu::Font.new(30)
    @medium_font = Gosu::Font.new(25)
    @position_score1 = position_score1
    @position_score2 = position_score2
  end

  def draw(game)
    draw_score("1", game[:score_player1], @position_score1)
    draw_score("2", game[:score_player2], @position_score2)
    draw_win_set(game[:set_winner]) if game[:win_set]
    draw_game_over(game[:score_player1], game[:score_player2]) if game[:game_over]
  end

  private

  def draw_game_over(score1, score2)
    @big_font.draw("GAME OVER", 220, 150, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW)
    if score1 > score2
      winner = 1
      loser = 2
    else
      winner = 2
      loser = 1
    end
    @big_font.draw("PLAYER #{winner} IS THE WINNER !", 130, 200, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW)
    @medium_font.draw("Press Space to restart or Escape to stop", 100, 250, ZOrder::UI, 1.0, 1.0)
  end

  def draw_score(player, score, position)
    @font.draw("Player #{player}: #{score}", position, 10, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW)
  end

  def draw_win_set(winner)
    @medium_font.draw("PLAYER #{winner} WON THE SET !", 200, 180, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW)
  end
end
