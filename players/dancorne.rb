# frozen_string_literal: true

Player.register("dancorne") do |history|
  history.empty? ? :share : history.last.reject { |k, v| k == "dancorne" }.values.last
end
