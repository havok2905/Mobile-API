class Checkpoints::CheckpointCondition < ModelBase
  has_many :checkpoints_checkpoints
  has_many :checkpoints_checkpoint_associations
end
