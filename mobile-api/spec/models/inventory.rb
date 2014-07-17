require_relative '../spec_helper'

describe Games::Inventory do

  before :each do
    @inventory = Games::Inventory.new
  end

  subject { @inventory }

  it { should have_many :inventory_items }
  it { should belong_to :game }

  describe 'validations' do
    it 'should require a game' do
      @inventory.should have(1).error_on(:game)
    end
  end

end
