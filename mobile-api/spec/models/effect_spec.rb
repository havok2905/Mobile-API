require_relative '../spec_helper'

describe Items::Effect do

  before do
    @effect = mock_model( Items::Effect )
  end

  subject { @effect }

  it { should have_and_belong_to_many :items }

end
