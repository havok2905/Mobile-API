class Items::Item < ModelBase
  has_and_belongs_to_many :item, class_name: 'Items::Item'
end
