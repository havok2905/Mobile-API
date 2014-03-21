class Checkpoints::CheckpointAssociation < ModelBase
  has_many :checkpoints_checkpoints
  validates :checkpoints_connected?, on: :create
  validates :checkpoints_connected?, on: :update

  # Node associaitons need to stay two dimmensional, unless we expect
  # players to break the laws of physics. These are not magic nodes.
  def checkpoints_connected?
    errors.add(:base, "You have unconnected nodes") unless checkpoints.size == 2
  end
end
