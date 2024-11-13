# frozen_string_literal: true

Player.register("tit_for_two_tat") do |history|
  if history.length < 2
    :share
  else
    history[-2..-1].none? { |game| game[:other] == :share} ? :steal : :share
  end
end
