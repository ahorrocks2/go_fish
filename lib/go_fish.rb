class Player
  define_method(:initialize) do |name|
    @name = name
    @cards = []
  end
end

class Game
  @@deck = []
  4.times do
    "Ace 1 2 3 4 5 6 7 8 9 10 Jack Queen King".split(" ").each() do |card|
      @@deck.push(card)
    end
  end
  @@deck.shuffle!()
  @@discard = []

  define_method(:initialize) do |player1, player2|
    @player1 = player1
    @player2 = player2
    @player1_cards = []
    @player2_cards = []
    @player1_points = 0
    @player2_points = 0
  end
  define_method(:player1) do
    @player1
  end
  define_method(:player2) do
    @player2
  end

  define_method(:deal) do
    @player1_cards.push(@@deck.take(7))
    7.times do
      @@deck.shift()
    end

    @player2_cards.push(@@deck.take(7))
    7.times do
      @@deck.shift()
    end
  end

  define_method(:ask_player2) do
    random = rand(7)
    card = player1_cards[random]
    if player2_cards.include?(card)
      @player1_points += 1
      @@discard.push(card)
      player1_cards.delete_at(random)
      count = 0
      player2_cards.each() do |spot|
        if spot == card
          @@discard.push(card)
          player2_cards.delete_at(count)
          count += 1
        end
      end
    else
      @player1_cards.push(@@deck.take(1))
      @@deck.shift()
    end
  end
  define_method(:ask_player1) do
    random = rand(7)
    card = player2_cards[random]
    if player1_cards.include?(card)
      @player2_points += 1
      @@discard.push(card)
      player2_cards.delete_at(random)
      count = 0
      player1_cards.each() do |spot|
        if spot == card
          @@discard.push(card)
          player1_cards.delete_at(count)
          count += 1
        end
      end
    else
      @player2_cards.push(@@deck.take(1))
      @@deck.shift()
    end
  end
end
