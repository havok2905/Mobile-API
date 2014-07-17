class Games::InventoryItem < ModelBase
  belongs_to :inventory, class_name: 'Games::Inventory'

  validates_presence_of :inventory, message: 'You must include an inventory'
  validates_presence_of :item_id, message: 'You must include an item id'
  validates_presence_of :item_class, message: 'You must include an item class name'

  validate :real_item_type?

  scope :weapons, -> { where(item_class: 'Items::WeaponItem') }
  scope :healths, -> { where(item_class: 'Items::HealthItem') }
  scope :stories, -> { where(item_class: 'Items::StoryItem') }

  def real_item_type?
    if item_class.present?
      unless ['Items::HealthItem', 'Items::WeaponItem', 'ItemsStoryItem'].include? self.item_class
        self.errors.add(:item_class, 'please include a valid item type')
      end
    end
  end

  def item_model
    self.item_class.constantize.where(id: self.item_id)
  end

end
