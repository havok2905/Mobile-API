require_relative 'spec_helper'

describe Checkpoints::CheckpointCondition do

  before do
    @condition = mock_model( Checkpoints::CheckpointCondition )
  end

  subject { @condition }

  it { should have_and_belong_to_many :checkpoints }
  it { should have_and_belong_to_many :associations }

end
