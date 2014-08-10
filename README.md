Mobile-API
==========

This is the API for the game manager Mobile. It allows you to play real world
ARG like games through a mobile device.

#TODOS

* Controller Tests
* User Permissions
* Incorperate Auth Gems
* Handle API tokens

#ERD

This app uses an ERD generation gem that spits out a PDF of the current schema.
Run `bundle exec erd` and it will save a PDF in the root of the project.

##Current Schema
![erd diagram](http://puu.sh/aeWST/00325f903b.png)

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
* game_by_location/:latitude/:longitude/:range/
* checkpoints_by_game/:game_id/
* checkpoints_by_location/:latitude/:longitude/
* possible_next_checkpoints/:id/
* previous_checkpoint/checkpoint/:game_id/

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
