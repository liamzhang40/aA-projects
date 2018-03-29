require 'rspec'
require 'tdd'

describe '#my_uniq' do

  it 'should remove all duplicates' do
    expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
  end
end

describe '#two_sum' do

  it 'should all pairs of positions that sum to zero' do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
  end
end

describe '#my_transpose' do

  it 'should transpose a matrix' do
    expect([[0, 1, 2], [3, 4, 5], [6, 7, 8]].my_transpose).to eq([[0, 1, 2], [3, 4, 5], [6, 7, 8]].transpose)
  end

  it 'should transpose a 2 x 3 matrix' do
    expect([[0, 1, 2], [3, 4, 5]].my_transpose).to eq([[0, 1, 2], [3, 4, 5]].transpose)
  end
end

describe 'stock_picker' do
  let(:stock_prices) { [500, 100, 240, 500] }
  it 'should take an array of numbers' do
    expect{stock_picker('arr')}.to raise_error(ArgumentError)
  end

  it 'should return an array of at least two dates' do
    expect(stock_picker(stock_prices).length).to eq(2)
  end

  it 'prevents selling stock before buying' do
    output = stock_picker(stock_prices)
    expect(output[0]).to be < output[1]
  end

  it 'returns the pair with the most profit' do
    output = stock_picker(stock_prices)
    expect(output).to eq([2,3])
  end
end
