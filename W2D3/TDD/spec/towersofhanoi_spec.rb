require 'towersofhanoi'
require 'rspec'


describe 'TowersOfHanoi' do
  subject(:towers) { TowersOfHanoi.new }

  describe '#initialize' do
    it 'initializes with a nested array' do
      expect(towers.sticks).to eq([[3, 2, 1], [], []])
    end

    it 'sets a game_over instance variable to be falsy' do
      expect(towers.game_over).to be false
    end
  end

  # describe '#get_input' do
  #   let(:input) { towers.get_input }
  #   it 'should return an array' do
  #     # input = towers.get_input
  #     expect(input.is_a?(Array)).to be true
  #   end
  #
  #   it 'should check for valid input' do
  #     expect(towers).to receive(:valid_input?)
  #     towers.get_input
  #   end
  # end

  describe '#valid_input?' do
    it 'should not allow moving from an empty stick' do
      expect{towers.valid_input?([1,2])}.to raise_error(ArgumentError)
    end

    it 'should not allow moving a big disc on top of a smaller disc' do
      towers.sticks = [[1], [3,2], []]
      expect{towers.valid_input?([1,0])}.to raise_error(ArgumentError)
    end

    it 'should not allow nonexistent sticks' do
      expect{towers.valid_input?([4,4])}.to raise_error(ArgumentError)
    end

  end



  describe '#move' do
    it "moves discs" do
      towers.move([0,1])
      expect(towers.sticks).to eq([[3,2], [1], []])
    end

  end

  describe '#check_won?' do
    # let(:towers) { TowersOfHanoi.new }
    it 'will udpate game over if game is won' do
      towers.sticks = [[1], [3,2], []]
      expect(towers.game_over).to be false
      towers.move([0,1])
      towers.check_won?
      expect(towers.game_over).to be true

    end
  end

end
