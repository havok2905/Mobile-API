class Checkpoints::Checkpoint < ModelBase
  has_and_belongs_to_many :associations, class_name: 'Checkpoints::CheckpointAssociation'
  has_and_belongs_to_many :conditions, class_name: 'Checkpoints::CheckpointCondition'
  has_many :items, class_name: 'Items::Item'
  belongs_to :game, class_name: 'Games::Game'

  validates_presence_of :game, message: 'Checkpoints need a game to belong to'
end
