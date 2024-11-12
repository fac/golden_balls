Player.register("Katie J") do |history|
  other_player_moves = []
  other_player_name = ""
  my_moves = []

  history.each do |game|
    game.each do |key, value|
      other_player_name = key
      if key != "Katie J"
        other_player_moves << value
      else
        my_moves << value
      end
    end
  end

  if other_player_moves.max_by { |move| move } == :steal
    :steal
  elsif other_player_moves.max_by { |move| move } == :share && my_moves.max_by { |move| move } == :share
    :steal
  else
    :share
  end
end