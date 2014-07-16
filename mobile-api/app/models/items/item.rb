class Items::Item < ModelBase
  has_and_belongs_to_many :effects, class_name: 'Items::Effect'
  belongs_to :checkpoint, class_name: 'Checkpoints::Checkpoint'
  belongs_to :checkpoint_association, class_name: 'Checkpoints::CheckpointAssociation'

  validates_presence_of :name, message: 'Your item must have a name'
  validates_presence_of :media_path, message: 'Your item must have an associated image'
  validates_presence_of :type, message: 'Your item must have a sub class type'
end
