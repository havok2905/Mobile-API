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
