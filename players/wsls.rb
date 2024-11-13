# frozen_string_literal: true

Player.register("wsls") do |history|
  history.empty? ? :share : history.last[:other]
  if history.empty?
    :share
  elsif history.last[:own] == history.last[:other]
    history.last[:own]
  else
    history.last[:own] == :steal ? :share : :steal
  end
end
