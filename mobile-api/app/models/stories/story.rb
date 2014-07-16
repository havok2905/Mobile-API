class Stories::Story < ModelBase
  belongs_to :condition, class_name: 'Checkpoints::CheckpointCondition'

  validates_presence_of :name, message: 'Your story must have a name'
  validates_presence_of :media_type, message: 'Your story must have a media type tag'
  validates_presence_of :media_path, message: 'Your story must have content'
end
