require_relative 'spec_helper'

describe Checkpoints::CheckpointCondition do

  before :each do
    @condition = mock_model( Checkpoints::CheckpointCondition )
  end

  subject { @condition }

  it { should have_and_belong_to_many :checkpoints }
  it { should have_and_belong_to_many :associations }

  describe 'validations' do
    describe 'belongs_to_something?' do
      it 'should be valid if it belongs to a checkpoint' do
        @condition.checkpoints = [Checkpoints::Checkpoint.new]
        @condition.should have(0).error_on(:checkpoints)
      end

      it 'should be valid if it belongs to an association' do
        @condition.checkpoints = [Checkpoints::CheckpointAssociation.new]
        @condition.should have(0).error_on(:associations)
      end

      it 'should not be valid if it belongs to nothing' do
        @condition.should have(1).error_on(:checkpoints)
        @condition.should have(1).error_on(:associations)
      end
    end
  end

end
