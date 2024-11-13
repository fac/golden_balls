# frozen_string_literal: true

require_relative '../game'
require_relative '../player'

describe Game do
  let(:game) { Game.new("a", "b") }

  context "with a share and a steal" do
    before do
      Player.register("a") { :share }
      Player.register("b") { :steal }
    end

    it "plays the game" do
      game.play

      expect(game.player1_score).to eq(0)
      expect(game.player2_score).to eq(3000)
      expect(game.player1_history).to eq([{ :own => :share, :other => :steal }] * 1000)
      expect(game.player2_history).to eq([{ :other => :share, :own => :steal }] * 1000)
    end
  end
end
