# This model represents a super class that makes multiple table inheritance work
# with items. We shouldn't actually be using these in the game.
#
# McLean : 7-17-2014
#

class Items::Item < ModelBase
  acts_as_superclass

  has_and_belongs_to_many :effects, class_name: 'Items::Effect'
  belongs_to :checkpoint, class_name: 'Checkpoints::Checkpoint'
  belongs_to :checkpoint_association, class_name: 'Checkpoints::CheckpointAssociation'

  validates_presence_of :name, message: 'Your item must have a name'
  validates_presence_of :media_path, message: 'Your item must have an associated image'

  scope :health,  -> { where as_item_type: 'Items::HealthItem' }
  scope :weapons, -> { where as_item_type: 'Items::WeaponItem' }
  scope :stories, -> { where as_item_type: 'Items::StoryItem'  }

  def self.item_types
    ['Weapon', 'Health', 'Story']
  end
end
