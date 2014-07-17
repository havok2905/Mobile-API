class Games::Game < ModelBase
  has_many :checkpoints, class_name: 'Checkpoints::Checkpoint'
  belongs_to :user, class_name: 'Games::User' 

  validates_presence_of :name, message: 'You must include a name'
  validates_presence_of :description, message: 'You must include a description'
  validates_presence_of :latitude, message: 'You must include a latitude'
  validates_presence_of :longitude, message: 'You must include a longitude'
end
