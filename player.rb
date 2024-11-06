# frozen_string_literal: true

module Player
  def self.register(name, &block)
    players[name] = block
  end

  def self.players
    @players ||= {}
  end
end
