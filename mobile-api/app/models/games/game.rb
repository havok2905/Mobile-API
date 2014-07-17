# This model represents a single defined game. This game has a location
# and a series of checkpoints that match up with the real world.
#
# McLean : 7-17-2014
#

class Games::Game < ModelBase
  has_many :checkpoints, class_name: 'Checkpoints::Checkpoint'
  belongs_to :user, class_name: 'Games::User'
  has_one :inventory, class_name: 'Games::Inventory'

  validates_presence_of :name, message: 'You must include a name'
  validates_presence_of :description, message: 'You must include a description'
  validates_presence_of :latitude, message: 'You must include a latitude'
  validates_presence_of :longitude, message: 'You must include a longitude'
end
