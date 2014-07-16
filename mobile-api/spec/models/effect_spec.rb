require_relative 'spec_helper'

describe Items::Effect do

  before do
    @effect = mock_model( Items::Effect )
  end

  subject { @effect }

  it { should have_and_belong_to_many :items }

  describe 'validations' do
    it 'should require a name'
      @effect.should have(1).error_on(:name)
    end

    it 'should require a media_path'
      @effect.should have(1).error_on(:media_path)
    end
  end

end
