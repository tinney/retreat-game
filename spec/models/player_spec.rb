RSpec.describe 'Player' do
  context 'validations' do
    it 'limits the total stats to 20' do
      subject = build(:player, water_stat: 30)
      expect(subject).to_not be_valid
    end

    it 'requires defaults stats' do
      subject = build(:player, water_stat: nil)
      expect(subject).not_to be_valid
    end

    it 'creates a move when started' do
      subject = create(:player)
      expect(subject.moves.size).to equal(1)
    end
  end
end
