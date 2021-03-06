# This model represents an action that gets triggered on a checkpoint or location
#
# McLean : 7-17-2014
#

class Checkpoints::CheckpointCondition < ModelBase
  has_and_belongs_to_many :checkpoints, class_name: 'Checkpoints::Checkpoint'
  has_and_belongs_to_many :associations, class_name: 'Checkpoints::CheckpointAssociation'

  validate :belongs_to_something?

  def belongs_to_something?
    if self.checkpoints.empty? && self.associations.empty?
      self.errors.add(:checkpoints, 'A condition needs to belong to a checkpoint or association')
      self.errors.add(:associations, 'A condition needs to belong to a checkpoint or association')
    end
  end
end
