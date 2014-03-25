class Stories::Story < ModelBase
  belongs_to :condition, class_name: 'Checkpoints::CheckpointCondition'
end
