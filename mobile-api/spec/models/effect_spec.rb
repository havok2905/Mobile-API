require_relative '../spec_helper'

describe Items::Effect do

  before do
    @effect = mock_model( Items::Effect )
  end

  subject { @item }

  it { should have_and_belong_to_many :items }

end
