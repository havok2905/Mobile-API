class Games::Inventory < ModelBase
  has_many :inventory_items, class_name: 'Games::InventoryItem'
  belongs_to :game, class_name: 'Games::Game'

  validates_presence_of :game, message: 'You must include a game'

  def self.item_constant(class_name)
    class_name.constantize
  end

  def items
    Games::InventoryItems.where(inventory_id: self.id).all.map do | item |
      item.item_model
    end
  end
end
