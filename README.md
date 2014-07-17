Mobile-API
==========

This is the API for the game manager Mobile. It allows you to play real world
ARG like games through a mobile device.

#ERD

This app uses an ERD generation gem that spits out a PDF of the current schema.
Run `bundle exec erd` and it will save a PDF in the root of the project.

#Unit Tests

This uses RSPEC. To run tests...
* `RAILS_ENV=test rake db:drop db:create db:migrate`
* `rspec spec/models/`
* `rspec spec/controllers/`

ALL tests must pass before a pull request is made for a feature.


#Geolocation

Location calculations are being done using the geo-distance gem.



#API METHOD LIST

##GAME

###GET
* dashboard/game/
* game_by_location/latitude/longitude/range/
* checkpoint/id/
* checkpoints/game/
* checkpoint/latitude/longitude/
* path/start/finish
* condition_met/id/arg
* possible_next_checkpoints/checkpoint/
* previous_checkpoint/checkpoint/
* story/id/
* stories/checkpoint/
* inventory/game/
* item/type/item_id

###PUT

###POST

###DELETE

##ADMIN

###GET
* model/id/

###PUT
* model/

###POST
* model/

###DELETE
* model/
