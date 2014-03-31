require_relative '../spec_helper'

describe Games::Game do

  before do
    @game = mock_model( Games::Game )
  end

  subject { @game }

  it { should have_many :checkpoints }

end
