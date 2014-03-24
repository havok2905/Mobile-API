class Checkpoints::CheckpointCondition < ModelBase
  has_and_belongs_to_many :checkpoints_checkpoints
  has_and_belongs_to_many :checkpoints_checkpoint_associations
end
