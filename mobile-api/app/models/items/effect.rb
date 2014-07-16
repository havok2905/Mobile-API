class Items::Effect < ModelBase
  has_and_belongs_to_many :items, class_name: 'Items::Item'

  validates_presence_of :name, message: 'Your effect must have a name'
  validates_presence_of :media_path, message: 'Your effect must have an associated image'
end
