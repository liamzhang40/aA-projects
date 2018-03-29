require 'rspec'
require 'card'

describe 'Card' do
  subject(:card) { Card.new(:diamond,5) }

  describe '#initialize' do
    it 'sets suit' do
      expect(card.suit).to eq(:diamond)
    end

    it 'sets number' do
      expect(card.number).to eq(5)
    end
  end



end
