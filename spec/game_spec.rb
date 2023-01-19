require_relative '../game'

describe Game do
  context 'Test for Game' do
    game = Game.new('Yes', '01/02/2016', '04/03/2016')
    it 'Will give an instance of a game' do
      expect(game).to be_an_instance_of Game
    end
    it 'Give the correct Multiplayer option' do
      expect(game.multiplayer).to eql 'Yes'
    end
    it 'Give the correct date when played last' do
      expect(game.last_played_at).to eql '01/02/2016'
    end
  end
end
