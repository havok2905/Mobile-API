# This model represents an item that can cause damage to people, locations,
# or other items. There is no support for this functionality yet, but I'm
# adding it just in case.
#
# McLean : 7-17-2014
#

class Items::WeaponItem < ModelBase
  acts_as :item, :class_name => 'Items::Item'
end
