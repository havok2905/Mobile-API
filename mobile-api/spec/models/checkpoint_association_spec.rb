require_relative '../spec_helper'

describe Checkpoints::CheckpointAssociation do

  before :each do
    @association = mock_model( Checkpoints::CheckpointAssociation )
  end

  subject { @association }

  it { should have_and_belong_to_many :checkpoints }
  it { should have_and_belong_to_many :conditions }

  describe 'validations' do
    describe 'checkpoints_connected?' do
      it 'should throw an error if you have less than two checkpoints' do
        @association.checkpoints = [ Checkpoints::Checkpoint.new ]
        @association.should have(1).error_on(:checkpoints)
      end

      it 'should throw an error if you have more than two checkpoints' do
        @association.checkpoints = [
          Checkpoints::Checkpoint.new,
          Checkpoints::Checkpoint.new,
          Checkpoints::Checkpoint.new
        ]
        @association.should have(1).error_on(:checkpoints)
      end

      it 'should validate if you have exactly two checkpoints' do
        @association.checkpoints = [
          Checkpoints::Checkpoint.new,
          Checkpoints::Checkpoint.new
        ]
        @association.should have(0).error_on(:checkpoints)
      end
    end
  end

end
