class Checkpoints::CheckpointController < ApplicationController

  # Return all Checkpoints::Checkpoint objects in the database
  #
  # @type    GET
  # @returns JSON response with all Checkpoints::Checkpoint objects
  def index
    @checkpoints = Checkpoints::Checkpoint.all

    respond_to do | format |
      format.json { render json: @checkpoints, methods: [ :game, :associations ] }
    end
  end


  # Return a single Checkpoints::Checkpoint by a given id
  #
  # @type    GET
  # @param   id
  # @returns JSON response with a Checkpoints::Checkpoint object
  def show
    @checkpoint = Checkpoints::Checkpoint.where( id:params[:id] ).all

    respond_to do | format |
      format.json { render json: @checkpoint, methods: [ :game, :associations ] }
    end
  end


  # Return Checkpoints::Checkpoint objects by a given game id
  #
  # @type    GET
  # @param   game_id
  # @returns JSON response with Checkpoints::Checkpoint objects
  def get_checkpoints_by_game
    @checkpoint = Checkpoints::Checkpoint.where( game_id:params[:game_id] ).all

    respond_to do | format |
      format.json { render json: @checkpoint, methods: [ :associations ] }
    end
  end


  # Return Checkpoints::Checkpoint objects by a given latitude and longitude
  #
  # @type    GET
  # @param   latitude
  # @param   longitude
  # @returns JSON response with Checkpoints::Checkpoint objects
  def get_checkpoints_by_location
    @checkpoint = Checkpoints::Checkpoint.where( latitude:params[:latitude], longitude:params[:longitude]).all

    respond_to do | format |
      format.json { render json: @checkpoint, methods: [ :game, :associations ] }
    end
  end


  # Return Checkpoints::Checkpoint objects connected to a single checkpoint
  # Only fist level associations
  #
  # @type    GET
  # @param   id
  # @returns JSON response with Checkpoints::Checkpoint objects
  def get_possible_next_checkpoints
    @associations = Checkpoints::Checkpoint.where( id: params[:id] ).first.associations.all

    @checkpoints = @associations.map { | association |
      association.checkpoints.first.id != params[:id].to_i ? association.checkpoints.first : association.checkpoints.last
    }

    respond_to do | format |
      format.json { render json: @checkpoints }
    end
  end


  # Return the last visited Checkpoints::Checkpoint object
  # Only fist level associations
  #
  # @type    GET
  # @param   id
  # @returns JSON response with a Checkpoints::Checkpoint object
  def get_previous_checkpoint
    @checkpoint = Checkpoints::Checkpoint.where( game_id: params[:game_id] ).order(:last_visited).all
    respond_to do | format |
      format.json { render json: @checkpoint }
    end
  end


  # creates a new Checkpoints::Checkpoint object
  #
  # @type    POST
  # @param   checkpoint
  # @returns JSON response with the newly created Checkpoints::Checkpoint object
  def create
    @checkpoint = Checkpoints::Checkpoint.new ( params[:checkpoints_checkpoint] )

    respond_to do | format |
      if @checkpoint.save
        format.json { render json: @checkpoint, methods: [ :game, :associations ] }
      else
        format.json { render json: { errors: @checkpoint.errors.full_messages, status: 422 } }
      end
    end
  end


  # updates a Checkpoints::Checkpoint object based on id
  #
  # @type    PUT
  # @param   id
  # @param   checkpoint
  # @returns JSON response with the newly updated Checkpoints::Checkpoint object
  def update
    @checkpoint = Checkpoints::Checkpoint.where( id:params[:id] )

    respond_to do | format |
      if @checkpoint.update_attributes ( params[:checkpoints_checkpoint] )
        format.json { render json: @checkpoint, methods: [ :game, :associations ] }
      else
        format.json { render json: { errors: @checkpoint.errors.full_messages, status: 422 } }
      end
    end
  end


  # updates a Checkpoints::Checkpoint object based on id
  #
  # @type    DELETE
  # @param   id
  # @returns JSON response with the newly deleted Checkpoints::Checkpoint object
  def destroy
    @checkpoint = Checkpoints::Checkpoint.find( params[:id] )

    respond_to do | format |
      if @checkpoint.destroy
        format.json { render json: @checkpoint, methods: [ :game, :associations ] }
      else
        format.json { render json: { errors: @checkpoint.errors.full_messages, status: 422 } }
      end
    end
  end

end
