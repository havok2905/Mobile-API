require_relative '../spec_helper'

describe Items::Item do

  before :each do
    @item = mock_model( Items::Item )
  end

  subject { @item }

  it { should have_and_belong_to_many :effects }
  it { should belong_to :checkpoint }
  it { should belong_to :checkpoint_association }

  describe 'validations' do
    it 'should require a name' do
      @item.should have(1).error_on(:name)
    end

    it 'should require a media_path' do
      @item.should have(1).error_on(:media_path)
    end

    it 'should require a type' do
      @item.should have(1).error_on(:type)
    end
  end

end
