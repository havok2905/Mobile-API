class Items::Item < ModelBase
  has_and_belongs_to_many :effects, class_name: 'Items::Effects'
  belongs_to :checkpoint, class_name: 'Checkpoints::Checkpoint'
  belongs_to :checkpoint_association, class_name: 'Checkpoints::CheckpointAssociation'
end
