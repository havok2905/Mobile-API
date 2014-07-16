class Checkpoints::CheckpointAssociation < ModelBase
  has_and_belongs_to_many :checkpoints, class_name: 'Checkpoints::Checkpoint'
  has_and_belongs_to_many :conditions, class_name: 'Checkpoints::CheckpointCondition'
  has_many :items, class_name: 'Items::Item'

  validate :checkpoints_connected?

  # Node associaitons need to stay two dimmensional, unless we expect
  # players to break the laws of physics. These are not magic nodes.
  def checkpoints_connected?
    errors.add(:checkpoints, "You have unconnected nodes") unless self.checkpoints.size == 2
  end
end
