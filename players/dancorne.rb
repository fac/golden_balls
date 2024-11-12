# frozen_string_literal: true

Player.register("dancorne") do |history|
  if history.empty?
    :share
  else
    history.last.reject { |k, v| k == "dancorne" }.values.last == :steal ? :steal : :share
  end
end
