# frozen_string_literal: true

Player.register("dancorne") do |history|
  history.empty? ? :share : history.last[:other]
end
