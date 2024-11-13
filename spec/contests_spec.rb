# frozen_string_literal: true

require_relative "../player"
Dir["./players/*.rb"].each { |file| require file }

describe "players" do
  Player.players.keys.each do |player|
    it "has a registered player named #{player}" do
      expect(Player.players).to have_key(player)
    end

    context "with no moves" do
      it "can make a turn for #{player}" do
        1000.times do
          expect(Player.players[player].call([])).to be_truthy
        end
      end
    end

    context "with history" do
      it "can make a turn for #{player}" do
        1000.times do
          history = [
            { own: :share, other: :share },
            { own: :steal, other: :steal },
            { own: :share, other: :steal },
            { own: :steal, other: :share }
          ].shuffle
          expect(Player.players[player].call(history)).to be_truthy
        end
      end
    end
  end
end
