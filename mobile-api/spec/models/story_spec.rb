require_relative '../spec_helper'

describe Stories::Story do

  before :each do
    @story = Stories::Story.new
  end

  subject { @story }

  it { should belong_to :condition }

  describe 'validations' do
    it 'should require a name' do
      @story.should have(1).error_on(:name)
    end

    it 'should require a media type' do
      @story.should have(1).error_on(:media_type)
    end

    it 'should require a media path' do
      @story.should have(1).error_on(:media_path)
    end
  end
end
