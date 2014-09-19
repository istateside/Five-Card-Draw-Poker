require 'deck'

describe Deck do
  describe "::all_cards" do
    subject(:all_cards) { Deck.all_cards }
  end

  let(:cards) do [
    Card.new(:hearts, :four),
    Card.new(:clubs, :six),
    Card.new(:spades, :queen),
    Card.new(:diamonds, :jack)
  ]
  end

  describe "#initialize" do

    context "new deck" do
      it "adds 52 cards on initialize" do
        deck = Deck.new
        expect(deck.count).to eq(52)
      end

      it "does not have duplicates of cards" do
        deck = Deck.new
        expect(deck.cards.uniq).to eq(deck.cards)
      end

      it "can be initialized with an array of cards" do
        deck = Deck.new(cards)
        expect(deck.count).to eq(4)
      end
    end
  end

  describe "#take" do

    let(:deck) { Deck.new(cards.dup) }

    it "takes cards from top of deck" do
      card = deck.cards[0]
      expect(deck.take(1)).to eq([card])
    end

    it "takes cards away from the deck" do
      deck.take(1)
      expect(deck.count).to eq(3)
    end

    it "doesn't allow you to take more cards than are in the deck" do
      expect{ deck.take(10) }.to raise_error("deck is not large enough")
    end


  end

  describe "#return" do

    let(:deck) { Deck.new(cards.dup) }

    let(:more_cards) do
      [
        Card.new(:spades, :ace),
        Card.new(:hearts, :ten),
        Card.new(:clubs, :deuce),
        Card.new(:diamonds, :seven)
      ]
    end


    it "adds cards to the deck" do
      deck.return(more_cards)
      expect(deck.count).to eq(8)
    end

    it "returns cards to the bottom of the deck" do
      deck.return(more_cards)
      expect(deck.cards.last(4)).to eq(more_cards)
    end

  end

end