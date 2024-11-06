# frozen_string_literal: true

Player.register("random") do |game|
  [:share, :steal].sample
end
