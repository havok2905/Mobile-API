class Checkpoints::CheckpointCondition < ModelBase
  has_and_belongs_to_many :checkpoints, class_name: 'Checkpoints::Checkpoint'
  has_and_belongs_to_many :associations, class_name: 'Checkpoints::CheckpointAssociaiton'
end
