class Items::HealthItem < ModelBase
  acts_as :item, :class_name => 'Items::Item'
end
