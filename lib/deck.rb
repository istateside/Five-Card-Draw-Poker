require 'card.rb'

class Deck

  attr_accessor :cards

  def self.all_cards
    all_cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        all_cards << Card.new(suit, value)
      end
    end
    all_cards
  end

  def initialize(cards= Deck.all_cards)
    @cards = cards.shuffle
  end

  def take(n)
    raise "deck is not large enough" if n > self.cards.count
    self.cards.shift(n)
  end

  def count
    @cards.count
  end

  def return(cards)
    @cards += cards
  end

end