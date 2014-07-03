class Items::Effect < ModelBase
  has_and_belongs_to_many :items, class_name: 'Items::Item'
end
