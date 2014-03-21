class Checkpoints::Checkpoint < ModelBase
  has_many :checkpoints_checkpoint_associations
  has_many :games_games
end
