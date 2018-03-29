require 'rspec'
require 'deck'


describe 'Deck' do
  subject(:deck) { Deck.new }
  let(:card) { double("card") }

  describe '#initialize' do
    it 'should update cards array to have 52 cards' do
      expect(deck.cards.length).to eq(52)
    end

    it 'should create 52 unique cards' do
      expect(deck.cards.uniq.length).to eq(52)
    end

    it 'should have keep track of discarded cards in an array' do
      expect(deck.discarded_cards).to eq([])
    end
  end

  describe '#draw' do
    it 'should return a array of cards' do
      expect(deck.draw(5)).to be_an Array
    end

    it 'should return an array of the same length' do
      expect(deck.draw(5).length).to be(5)
    end

    it 'should upate the cards array' do
      pre_length = deck.cards.length
      deck.draw(5)
      expect(deck.cards.length).to_not eq(pre_length)
    end

    it 'should return cards from top of the deck' do
      pre_cards = deck.cards.dup
      cards_drawn = deck.draw(5)
      expect(cards_drawn).to eq(pre_cards.last(5))
    end

    it 'should raise an error if number of cards in deck is too small' do
      expect { deck.draw(53) }.to raise_error "There is not enough cards in the deck!!"
    end
  end

  describe '#receive_trash' do
    it 'should add discarded cards to discarded_cards array' do
      deck.receive_trash([card])
      expect(deck.discarded_cards).to include(card)
    end
  end
end
