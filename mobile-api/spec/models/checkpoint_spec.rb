require_relative '../spec_helper'

describe Checkpoints::Checkpoint do

  before :each do
    @checkpoint = mock_model( Checkpoints::Checkpoint )
  end

  subject { @checkpoint }

  it { should have_and_belong_to_many :associations }
  it { should belong_to :game }

  describe 'validations' do
    it 'should require a game' do
      @checkpoint.should have(1).error_on(:game)
    end
  end

end
