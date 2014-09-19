require 'deck.rb'

class Hand

  attr_reader :deck
  attr_accessor :cards

  def initialize(deck)
    @deck = deck
    @cards = deck.take(5)
  end

  def display
    @cards.map(&:to_s).join(' ')
  end

  def values
    self.sort
    @cards.map(&:value)
  end

  def suits
    @cards.map(&:suit)
  end

  def replace(card)
    raise "Card not in hand" unless @cards.include?(card)
    @cards.delete(card)
    @cards += @deck.take(1)
  end

  def beats_hand?(other_hand)
    if self.strength > other_hand.strength
      return true
    elsif self.strength < other_hand.strength
      return false
    else
      self.high_card > other_hand.high_card
    end
  end

  def strength
    return 9 if royal_flush?
    return 8 if straight_flush?
    return 7 if four_of_a_kind?
    return 6 if full_house?
    return 5 if flush?
    return 4 if straight?
    return 3 if three_of_a_kind?
    return 2 if two_pair?
    return 1 if one_pair?
    return 0
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

  def four_of_a_kind?
    value_counts.values.count(4) == 1
  end

  def full_house?
    self.one_pair? && self.three_of_a_kind?
  end

  def straight?
    value_string = Card.values.reverse.join(' ')
    value_string.include?(self.values.join(' '))
  end

  def flush?
    self.suits.uniq.count == 1
  end

  def straight_flush?
    self.straight? && self.flush?
  end

  def royal_flush?
    self.straight_flush? && self.values.include?(:ace)
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