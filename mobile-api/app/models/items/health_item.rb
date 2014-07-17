# This model represents an item that can either heal your self or other
# characters.
#
# McLean : 7-17-2014
#

class Items::HealthItem < ModelBase
  acts_as :item, :class_name => 'Items::Item'
end
