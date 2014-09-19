require 'hand'
require 'card'

describe Hand do

  let(:deck) { Deck.new }
  let(:hand) { Hand.new(deck) }

  describe '#initialize' do

    it "assigns a deck" do
      expect(hand.deck).to eq(deck)
    end

    it "takes five cards from the deck" do
      expect(hand.cards.count).to eq(5)
    end
  end


  describe "#replace" do

    let(:cards) {[
      Card.new(:spades, :ace),
      Card.new(:clubs, :ten),
      Card.new(:diamonds, :five),
      Card.new(:hearts, :three),
      Card.new(:diamonds, :jack)
      ]}

    before(:each) { hand.cards = cards }

    it "raises an error if card is not in the hand" do
      card = Card.new(:spades, :king)
      expect { hand.replace(card) }.to raise_error("Card not in hand")
    end

    it "deletes card from hand" do
      card = cards.first
      hand.replace(card)
      expect(hand.cards.include?(card)).to eq(false)
    end

    it "adds a new card to the hand" do
      card = cards.first
      hand.replace(card)
      expect(hand.cards).to_not eq(cards)
      expect(hand.cards.count).to eq(5)
    end
  end

  describe "#strength" do

    let(:cards) {[
      Card.new(:spades, :ace),
      Card.new(:clubs, :ten),
      Card.new(:diamonds, :five),
      Card.new(:hearts, :three),
      Card.new(:diamonds, :jack)
      ]}

    before(:each) { hand.cards = cards }

    it "returns a number based on the strength of the hand"

    describe 'helper methods' do

      describe '#high_card' do

        it "returns the value of the highest card in the hand" do
          expect(hand.high_card).to eq(12)
        end

      end

      describe '#value_counts' do

        it "returns a hash of card values and the number of times they appear" do
          hand.cards = [
            Card.new(:spades, :four),
            Card.new(:diamonds, :four),
            Card.new(:diamonds, :ten),
            Card.new(:clubs, :seven),
            Card.new(:hearts, :queen)
          ]
          value_counts = hand.value_counts

          expect(value_counts[:four]).to eq(2)
          expect(value_counts[:seven]).to eq(1)
          expect(value_counts[:ten]).to eq(1)
          expect(value_counts[:queen]).to eq(1)
        end

      end

      describe '#sort' do

        let(:cards) {[
          Card.new(:spades, :ace),
          Card.new(:clubs, :ten),
          Card.new(:diamonds, :five),
          Card.new(:hearts, :three),
          Card.new(:diamonds, :jack)
        ]}

        let(:sorted_cards) {[
          Card.new(:spades, :ace),
          Card.new(:diamonds, :jack),
          Card.new(:clubs, :ten),
          Card.new(:diamonds, :five),
          Card.new(:hearts, :three)
        ]}

        it "should sort according to values in descending order" do
          hand.cards = cards
          hand.sort
          expect(hand.cards).to eq(sorted_cards)
        end
      end

      describe "#one_pair?" do

        it "returns true if there is one pair in the hand" do
          hand.cards = [
            Card.new(:spades, :four),
            Card.new(:diamonds, :four),
            Card.new(:diamonds, :ten),
            Card.new(:clubs, :seven),
            Card.new(:hearts, :queen)
          ]
          expect(hand.one_pair?).to eq(true)
        end

        it "returns false if there are zero pairs in the hand" do
          hand.cards = [
            Card.new(:spades, :four),
            Card.new(:diamonds, :two),
            Card.new(:diamonds, :ten),
            Card.new(:clubs, :seven),
            Card.new(:hearts, :queen)
          ]
          expect(hand.one_pair?).to eq(false)
        end

        it "returns false if there are multiple pairs in the hand" do
          hand.cards = [
            Card.new(:spades, :four),
            Card.new(:diamonds, :four),
            Card.new(:diamonds, :ten),
            Card.new(:clubs, :ten),
            Card.new(:hearts, :queen)
          ]
          expect(hand.one_pair?).to eq(false)
        end

      end

      describe "#two_pair?" do

        it "returns true if there is two pair in the hand" do
          hand.cards = [
            Card.new(:spades, :four),
            Card.new(:diamonds, :four),
            Card.new(:diamonds, :ten),
            Card.new(:clubs, :ten),
            Card.new(:hearts, :queen)
          ]
          expect(hand.two_pair?).to eq(true)
        end

        it "returns false if there are zero pairs in the hand" do
          hand.cards = [
            Card.new(:spades, :four),
            Card.new(:diamonds, :two),
            Card.new(:diamonds, :ten),
            Card.new(:clubs, :seven),
            Card.new(:hearts, :queen)
          ]
          expect(hand.two_pair?).to eq(false)
        end

        it "returns false if there is one pairs in the hand" do
          hand.cards = [
            Card.new(:spades, :four),
            Card.new(:diamonds, :four),
            Card.new(:diamonds, :ten),
            Card.new(:clubs, :seven),
            Card.new(:hearts, :queen)
          ]
          expect(hand.two_pair?).to eq(false)
        end

      end

      describe "#straight"

      describe "#three_of_a_kind?" do

        it "returns true if there are three of a kind in the hand" do
          hand.cards = [
            Card.new(:spades, :four),
            Card.new(:diamonds, :four),
            Card.new(:hearts, :four),
            Card.new(:clubs, :ten),
            Card.new(:hearts, :queen)
          ]
          expect(hand.three_of_a_kind?).to eq(true)
        end

        it "returns false if there are not three of a kind in the hand" do
          hand.cards = [
            Card.new(:spades, :four),
            Card.new(:diamonds, :two),
            Card.new(:diamonds, :ten),
            Card.new(:clubs, :seven),
            Card.new(:hearts, :queen)
          ]
          expect(hand.three_of_a_kind?).to eq(false)
        end

      end

      describe "#beats_hand?"

      end

    end
end