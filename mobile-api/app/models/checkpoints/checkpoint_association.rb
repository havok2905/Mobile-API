# This model represents a pathway between two checkpoints. This exists to allow
# for building the story graph, as well as to allow conditions to trigger depending
# on how you reached checkpoints.
#
# Example:
# Point A to Point B at 10:00am => Nothing Happens
# Point C to Point B at 10:00am => Picks up Story Item
#
# This can help with setting up very intersting open worlds
#
# McLean : 7-17-2014
#

class Checkpoints::CheckpointAssociation < ModelBase
  has_and_belongs_to_many :checkpoints, class_name: 'Checkpoints::Checkpoint'
  has_and_belongs_to_many :conditions, class_name: 'Checkpoints::CheckpointCondition'
  has_many :items, class_name: 'Items::Item'

  validate :checkpoints_connected?

  # Node associaitons need to stay two dimmensional, unless we expect
  # players to break the laws of physics. These are not magic nodes.
  def checkpoints_connected?
    unless self.checkpoints.size == 2
      self.errors.add(:checkpoints, "You have unconnected nodes")
    end
  end
end
