require_relative 'spec_helper'

describe Games::Game do

  before do
    @game = mock_model( Games::Game )
  end

  subject { @game }

  it { should have_many :checkpoints }

  describe 'validations' do
    it 'should require a name'
      @game.should have(1).error_on(:name)
    end

    it 'should require a description'
      @game.should have(1).error_on(:description)
    end

    it 'should require a latitude'
      @game.should have(1).error_on(:latitude)
    end

    it 'should require a longitude'
      @game.should have(1).error_on(:longitude)
    end
  end

end
