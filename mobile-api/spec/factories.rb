FactoryGirl.define do

  # Game models
  factory :game, class: Games::Game do
    name 'Lorem Ipsum'
    description 'Lorem ipsum dolor set amet lorem ipsum dolor set amet lorem'
    latitude 28.600000
    longitude -81.339235
  end

  # Checkpoint models
  factory :checkpoint, class: Checkpoints::Checkpoint do
    association :game, factory: :game, name: 'Lorem Ipsum', description: 'foo', latitude: 1, longitude: 1
    name 'Lorem Ipsum'
    description 'Lorem ipsum dolor set amet lorem ipsum dolor set amet lorem'
    latitude 28.600000
    longitude -81.339235
    followed 0
    last_visited DateTime.now
  end

  factory :association, class: Checkpoints::CheckpointAssociation do
    followed 0
    last_visited '2007-12-04 00:00:00'
  end

  factory :condition, class: Checkpoints::CheckpointCondition do
    name 'Lorem Ipsum'
    description 'Lorem ipsum dolor set amet lorem ipsum dolor set amet lorem'
    achieved false
  end

  # Story models
  factory :story, class: Stories::Story do
    name 'Lorem Ipsum'
    description 'Lorem ipsum dolor set amet lorem ipsum dolor set amet lorem'
    media_type 'image'
    media_path 'image.png'
  end
end
