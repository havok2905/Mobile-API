class Checkpoints::CheckpointAssociation < ModelBase
  has_and_belongs_to_many :checkpoints_checkpoints
  validate :checkpoints_connected?

  # Node associaitons need to stay two dimmensional, unless we expect
  # players to break the laws of physics. These are not magic nodes.
  def checkpoints_connected?
    errors.add(:base, "You have unconnected nodes") unless checkpoints.size == 2
  end
end
