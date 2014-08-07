# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

games = Games::Game.create([
  {
      name: 'Lorem Ipsum',
      description: 'Lorem ipsum dolor set amet lorem ipsum dolor set amet lorem',
      latitude: '28.600000',
      longitude: '-81.339235'
  },
  {
      name: 'Lorem Ipsum Two',
      description: 'Lorem ipsum dolor set amet lorem ipsum dolor set amet lorem',
      latitude: '29.600000',
      longitude: '-82.339235'
  }
])


checkpoints = Checkpoints::Checkpoint.create([
    {
      name: 'Lorem Ipsum',
      description: 'Lorem ipsum dolor set amet lorem ipsum dolor set amet lorem',
      latitude: '28.600000',
      longitude: '-81.339235',
      followed: 0,
      last_visited: nil,
      game: games[0]
    },
    {
      name: 'Lorem Ipsum 2',
      description: 'Lorem ipsum dolor set amet lorem ipsum dolor set amet lorem',
      latitude: '29.600000',
      longitude: '-82.339235',
      followed: 0,
      last_visited: nil,
      game: games[0]
    },
    {
      name: 'Lorem Ipsum 2',
      description: 'Lorem ipsum dolor set amet lorem ipsum dolor set amet lorem',
      latitude: '30.600000',
      longitude: '-83.339235',
      followed: 0,
      last_visited: nil,
      game: games[0]
    }
])

associations = Checkpoints::CheckpointAssociation.create([
  {
    followed: 0,
    last_visited: nil,
    checkpoints: [checkpoints[0], checkpoints[1]]
  },
  {
    followed: 0,
    last_visited: nil,
    checkpoints: [checkpoints[0], checkpoints[2]]
  }
])

story_items = Items::StoryItem.create([
  {
    name: 'hat',
    media_path: 'hat.png'
  },
  {
    name: 'duster',
    media_path: 'duster.png'
  },
  {
    name: 'gem',
    media_path: 'gem.png'
  }
])

weapon_items = Items::WeaponItem.create([
  {
    name: 'gun',
    media_path: 'gun.png'
  },
  {
    name: 'sword',
    media_path: 'sword.png'
  },
  {
    name: 'hammer',
    media_path: 'hammer.png'
  }
])

health_items = Items::HealthItem.create([
  {
    name: 'potion',
    media_path: 'potion.png'
  },
  {
    name: 'medkit',
    media_path: 'medkit.png'
  },
  {
    name: 'injection',
    media_path: 'injection.png'
  }
])
