class Checkpoints::Checkpoint < ModelBase
  has_and_belongs_to_many :checkpoints_checkpoint_associations
  has_many :games_games
end
