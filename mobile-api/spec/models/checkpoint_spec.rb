require_relative 'spec_helper'

describe Checkpoints::Checkpoint do

  before do
    @checkpoint = mock_model( Checkpoints::Checkpoint )
  end

  subject { @checkpoint }

  it { should have_and_belong_to_many :associations }
  it { should belong_to :game }

  describe 'validations' do
    it 'should require a game'
      @checkpoint.should have(1).error_on(:game)
    end
  end

end
