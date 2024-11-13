# frozen_string_literal: true

Player.register("simon") do |history|
  my_moves = []
  their_moves = []
  history.each do |move|
    move.transform_keys(&:to_sym) => { own: my_move, other: their_move }
    my_moves << my_move
    their_moves << their_move
  end
  my_most_common_move = my_moves.max_by { |move| my_moves.count(move) }
  their_most_common_move = their_moves.max_by { |move| their_moves.count(move) }
  if my_most_common_move == their_most_common_move
    my_most_common_move == :share ? :share : :steal
  else
    their_most_common_move == :share ? :steal : :share
  end
end
