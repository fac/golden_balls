# frozen_string_literal: true

Player.register("grim_trigger") do |history|
  history.empty?  || history.none? { |game| game[:other] == :steal} ? :share : :steal
end
