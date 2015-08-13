require('rspec')
require('go_fish')

describe(Game) do
  describe('#player1') do
    it('returns player1') do
      player1 = Player.new("bob")
      player2 = Player.new("sue")
      test_game = Game.new(player1, player2)
      expect(test_game.player1()).to(eq(player1))
    end
  end
  describe('#player2') do
    it('returns player2') do
      player1 = Player.new("bob")
      player2 = Player.new("sue")
      test_game = Game.new(player1, player2)
      expect(test_game.player2()).to(eq(player2))
    end
  end
  describe('#deal') do
    it('deals 7 cards to each player') do
      test_deck = Game.new("Greg", "Gretchen")
      player1_cards = []
      player2_cards = []
      test_deck.deal()
      expect(player1_cards.length() == 7 && player2_cards.length() == 7)
    end
  end
end
