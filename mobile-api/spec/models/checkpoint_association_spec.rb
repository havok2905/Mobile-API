require_relative '../spec_helper'

describe Checkpoints::CheckpointAssociation do

  before do
    @association = mock_model( Checkpoints::CheckpointAssociation )
  end

  subject { @association }

  it { should have_and_belong_to_many :checkpoints }
  it { should have_and_belong_to_many :conditions }

end
