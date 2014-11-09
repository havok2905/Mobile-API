require_relative '../spec_helper'

describe Games::Game do

  before :each do
    @game = mock_model(Games::Game)
  end

  subject { @game }

  it { should have_many :checkpoints }
  it { should have_one :inventory }
  it { should belong_to :user }

  describe 'validations' do
    it 'should be valid' do
      @game.should validate_presence_of(:name).and_return(0)
    end

    it 'should require a description' do
      @game.should validate_presence_of :description
    end

    it 'should require a latitude' do
      @game.should have(1).error_on(:latitude)
    end

    it 'should require a longitude' do
      @game.should have(1).error_on(:longitude)
    end
  end

end
