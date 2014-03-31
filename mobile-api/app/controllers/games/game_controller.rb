class Games::GameController < ApplicationController

  # Return all Games::Game objects in the database
  #
  # @type    GET
  # @returns JSON response with all Games::Game objects
  def index
    @game = Games::Game.all

    respond_to do | format |
      format.json { render json: @game }
    end
  end


  # Return a single Games::Game by a given id
  #
  # @type    GET
  # @param   id
  # @returns JSON response with a Games::Game object
  def show
    @games = Games::Game.where( id:params[:id] ).all

    respond_to do | format |
      format.json { render json: @games }
    end
  end


  # Return a single Games::Game object based on location
  #
  # @type    GET
  # @param   latitude
  # @param   longitude
  # @param   range
  # @returns JSON response with an array of Games::Game objects
  def get_by_location
    @center_x = params[:latitude]
    @center_y = params[:longitude]
    @radius   = params[:range]

    @games = Games::Game.select { | game |
      in_circle_bounds? @center_x, @center_y, game.latitude, game.longitude, @radius
    }

    respond_to do | format |
      format.json { render json: @games }
    end

  end


  # creates a new Games::Game object
  #
  # @type    POST
  # @param   game
  # @returns JSON response with the newly created Games::Game object
  def create
    @game = Games::Game.new ( params[:games_game] )

    respond_to do | format |
      if @game.save
        format.json { render json: @game }
      else
        format.json { render json: { errors: @game.errors.full_messages, status: 422 } }
      end
    end
  end


  # updates a Games::Game object based on id
  #
  # @type    PUT
  # @param   id
  # @param   game
  # @returns JSON response with the newly updated Games::Game object
  def update
    @game = Games::Game.where( id:params[:id] )

    respond_to do | format |
      if @game.update_attributes ( params[:games_game] )
        format.json { render json: @game }
      else
        format.json { render json: { errors: @game.errors.full_messages, status: 422 } }
      end
    end
  end


  # updates a Games::Game object based on id
  #
  # @type    DELETE
  # @param   id
  # @returns JSON response with the newly deleted Games::Game object
  def destroy
    @game = Games::Game.find( params[:id] )

    respond_to do | format |
      if @game.destroy
        format.json { render json: @game }
      else
        format.json { render json: { errors: @game.errors.full_messages, status: 422 } }
      end
    end
  end


  ## I totally ripped these formulas from online without testing them
  ## This will probably bite me in the ass later :/
  ## Will break these out into a map handling class later after I'm sure they work

  # Return if a checkoint is within bounds of a set circle
  #
  # @param   latitude
  # @param   longitude
  # @param   range
  # @returns boolean
  def in_circle_bounds?( center_x, center_y, x, y, radius )
    center_x = center_x.to_f
    center_y = center_y.to_f
    radius = radius.to_f
    ( x - center_x )**2 + ( y - center_y )**2 < radius**2
  end


  # Return if a checkoint is on the border of a set circle
  #
  # @param   latitude
  # @param   longitude
  # @param   range
  # @returns boolean
  def on_circle_bounds?( center_x, center_y, x, y, radius )
    center_x = center_x.to_f
    center_y = center_y.to_f
    radius = radius.to_f
    ( x - center_x )**2 + ( y - center_y )**2 == radius**2
  end


  # Return if a checkoint is out of the of a set circle
  #
  # @param   latitude
  # @param   longitude
  # @param   range
  # @returns boolean
  def out_circle_bounds?( center_x, center_y, x, y, radius )
    center_x = center_x.to_f
    center_y = center_y.to_f
    radius = radius.to_f
    ( x - center_x )**2 + ( y - center_y )**2 > radius**2
  end

end
