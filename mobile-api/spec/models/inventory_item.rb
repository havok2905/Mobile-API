require_relative '../spec_helper'

describe Games::InventoryItem do

  before :each do
    @inventory_item = Games::InventoryItem.new
  end

  subject { @inventory_item }

  it { should belong_to :inventory }

  describe 'validations' do
    it 'should require an inventory' do
      @inventory_item.should have(1).error_on(:inventory)
    end

    it 'should require an item id' do
      @inventory_item.should have(1).error_on(:item_id)
    end

    it 'should require an item cass' do
      @inventory_item.should have(1).error_on(:item_class)
    end

    describe 'real_item_type?' do
      it 'should be valid with a real item class name' do
        @inventory_item.item_class = 'Items::HealthItem'
        @inventory_item.should have(0).error_on(:item_class)
      end

      it 'should not be valid with a fake item class name' do
        @inventory_item.item_class = 'Items::FakeItem'
        @inventory_item.should have(0).error_on(:fake_class)
      end
    end
  end

end
