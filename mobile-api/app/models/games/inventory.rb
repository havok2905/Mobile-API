# Games have inventories that are made up of items. We use an intermediary
# model to manage the actual items contained in the inventory.
#
# McLean : 7-17-2014
#

class Games::Inventory < ModelBase
  has_many :inventory_items, class_name: 'Games::InventoryItem'
  belongs_to :game, class_name: 'Games::Game'

  validates_presence_of :game, message: 'You must include a game'
end
