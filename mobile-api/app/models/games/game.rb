class Games::Game < ModelBase
  has_many :checkpoints, class_name: 'Checkpoints::Checkpoint'
end
