require 'hand.rb'

class Player
  attr_reader :name
  attr_accessor :bankroll, :hand

  def initialize(name, hand, bankroll= 1_000)
    @name = name
    @hand = hand
    @bankroll = bankroll
  end

  def get_input(bet_amt)
    puts "Current bet: #{bet_amt}"
    puts
    puts "Would you like to fold, call the bet, or raise the bet?"
    options = ['f', 'c', 'r']
    input = gets.chomp.downcase
    case input
    when 'f'
      fold
    when 'c'
      call(bet_amt)
    when 'r'
      raise_bet(bet_amt)
    else
      raise "Invalid input."
    end
  rescue StandardError => e
    puts e.message
    retry
  end

  def fold
    @hand = []
  end

  def call(bet_amt)
    @bankroll -= bet_amt
    bet_amt
  end

  def raise_bet(bet_amt)

  end
end