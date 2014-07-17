# This model represents an effect that we decorate items with. This will end up
# being used to implement a decorator pattern somewhere on the front end
# application.
#
# McLean : 7-17-2014
#

class Items::Effect < ModelBase
  has_and_belongs_to_many :items, class_name: 'Items::Item'

  validates_presence_of :name, message: 'Your effect must have a name'
  validates_presence_of :media_path, message: 'Your effect must have an associated image'
end
