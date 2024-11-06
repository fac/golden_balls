# frozen_string_literal: true

require_relative "player"
require_relative "game"
Dir[File.join(__dir__, "players", "*.rb")].each do |file|
  require file
end

# take the cross product of all players
players = Player.players.keys
pairs = players.product(players)
pairs.map! { |pair| pair.sort }.uniq!
scores = Hash.new(0)

# play each pair of players against each other
pairs.each do |pair|
  player1, player2 = pair
  game = Game.new(player1, player2)
  game.play
  scores[player1] += game.player1_score
  scores[player2] += game.player2_score
  puts "#{player1} vs #{player2}: #{game.player1_score} to #{game.player2_score}"
end

puts "--------"

scores
  .sort_by { |player, score| -score }
  .each { |player, score| puts "#{player}: #{score}" }


