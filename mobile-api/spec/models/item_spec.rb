require_relative '../spec_helper'

describe Items::Item do

  before do
    @item = mock_model( Items::Item )
  end

  subject { @item }

  it { should have_and_belong_to_many :effects }
  it { should belong_to :checkpoint }
  it { should belong_to :checkpoint_association }

end
