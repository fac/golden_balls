# frozen_string_literal: true

class Game
  attr_reader :player1, :player2, :player1_score, :player2_score
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @player1_score = 0
    @player2_score = 0
  end

  def play
    1000.times do
      play_round
    end
  end

  def play_round
    player1_choice = Player.players[@player1].call(player1_history.dup)
    player2_choice = Player.players[@player2].call(player2_history.dup)
    player1_history << { own: player1_choice, other: player2_choice }
    player2_history << { other: player1_choice, own:  player2_choice }

    case [player1_choice, player2_choice]
    when [:share, :share]
      @player1_score += 2
      @player2_score += 2
    when [:share, :steal]
      @player2_score += 3
    when [:steal, :share]
      @player1_score += 3
    when [:steal, :steal]
      # nothing happens
    end
  end

  def player1_history
    @player1_history ||= []
  end

  def player2_history
    @player2_history ||= []
  end
end
