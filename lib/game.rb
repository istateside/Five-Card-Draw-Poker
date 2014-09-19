class Game

  attr_accessor :ante, :pot, :players, :deck

  def initialize
    @deck = Deck.new
    @pot = 0
    @ante = 0
  end
  # set up game
  # => get num of players
  # => create deck

  # play loop
  # => all players put ante into the pot from their bankroll
  # => dealer deals out cards, betting round begins
    # => each player decides to fold, call or raise
    # => call: match bet of last player, add to pot
    # => raise: increase bet, add to pot
    # => fold: drop out of game, discard cards
    # => betting round continues until all players have checked or folded
  # => draw round begins
    # => players still in game can trade in 1, 2, or 3 cards and replace them
    # => if player has ace, can trade in 4 and reveal the ace
  # => after draw round, one more round of betting
  # => after 2nd bet round, players show hands and winner takes the pot

end