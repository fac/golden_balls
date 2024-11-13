# frozen_string_literal: true

Player.register("Andrew Rodger") do |games|
  opposition_choices = games.map do |game|
    game.reject{ |k,v| k ==  :own}.values.first
  end
  if opposition_choices.select{ _1 == :share }.length > opposition_choices.select{ _1 == :steal }.length
    :steal
  else
    :share
  end
end
