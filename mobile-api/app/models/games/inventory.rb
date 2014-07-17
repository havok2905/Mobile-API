class Games::Inventory < ModelBase
  has_many :inventory_items, class_name: 'Games::InventoryItem'
  belongs_to :game, class_name: 'Games::Game'

  validates_presence_of :game, message: 'You must include a game'
end
