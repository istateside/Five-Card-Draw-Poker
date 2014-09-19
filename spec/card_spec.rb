require 'card'

describe Card do

  subject(:card) { Card.new(:clubs, :five) }

  context "new card" do

    it "has a suit" do
      expect(card.suit).to eq(:clubs)
    end

    it "has a value" do
      expect(card.value).to eq(:five)
    end

  end

  context "class methods" do

    it "returns a suit when called" do
      expect(Card.suits.first).to eq(:clubs)
    end

    it "returns a value when called" do
      expect(Card.values.first).to eq(:deuce)
    end

  end


end
