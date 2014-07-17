# This model represents a media form of telling the story for the game.
# This can be text, video, and image, etc. These story elements are
# discovered after triggering a condition at a checkpoint or association.
# These are not stored in an inventory and are short living.
#
# McLean : 7-17-2014
#

class Stories::Story < ModelBase
  belongs_to :condition, class_name: 'Checkpoints::CheckpointCondition'

  validates_presence_of :name, message: 'Your story must have a name'
  validates_presence_of :media_type, message: 'Your story must have a media type tag'
  validates_presence_of :media_path, message: 'Your story must have content'
end
