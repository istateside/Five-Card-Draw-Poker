require 'deck'

class Hand

  # Create constant of hand values

  attr_reader :deck
  attr_accessor :cards

  def initialize(deck)
    @deck = deck
    @cards = deck.take(5)
  end

  def replace(card)
    raise "Card not in hand" unless @cards.include?(card)
    @cards.delete(card)
    @cards += @deck.take(1)
  end

  def high_card
    high = 0
    @cards.each do |card|
      value = Card.values.index(card.value)
      high = value if value > high
    end
    high
  end

  def one_pair?
    value_counts.values.count(2) == 1
  end

  def two_pair?
    value_counts.values.count(2) == 2
  end

  def three_of_a_kind?
    value_counts.values.count(3) == 1
  end


  def value_counts
    counts = Hash.new(0)
    @cards.each do |card|
      counts[card.value] += 1
    end
    counts
  end

  def sort
    @cards.sort_by! do |card|
      Card.values.index(card.value)
    end
    @cards = @cards.reverse
    nil
  end
end