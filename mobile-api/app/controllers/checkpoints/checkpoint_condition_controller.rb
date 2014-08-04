class Checkpoints::CheckpointConditionController < ApplicationController

  # Return all Checkpoints::CheckpointCondition objects in the database
  #
  # @type    GET
  # @returns JSON response with all Checkpoints::CheckpointCondition objects
  def index
    @checkpoint_conditions = Checkpoints::CheckpointCondition.all

    respond_to do | format |
      format.json { render json: @checkpoint_conditions }
    end
  end


  # Return a single Checkpoints::CheckpointCondition by a given id
  #
  # @type    GET
  # @param   id
  # @returns JSON response with a Checkpoints::CheckpointCondition object
  def show
    @checkpoint_condition = Checkpoints::CheckpointCondition.where( id:params[:id] ).all

    respond_to do | format |
      format.json { render json: @checkpoint_condition }
    end
  end


  # updates a Checkpoints::CheckpointCondition object based on id
  #
  # @type    PUT
  # @param   id
  # @param   checkpoint_condition
  # @returns JSON response with the newly updated Checkpoints::CheckpointCondition object
  def update
    @checkpoint_condition = Checkpoints::CheckpointCondition.where( id:params[:id] )

    respond_to do | format |
      if @checkpoint_condition.update_attributes ( params[:checkpoints_checkpoint_condition] )
        format.json { render json: @checkpoint_condition }
      else
        format.json { render json: { errors: @checkpoint_condition.errors.full_messages, status: 422 } }
      end
    end
  end


  # updates a Checkpoints::CheckpointCondition object based on id
  #
  # @type    DELETE
  # @param   id
  # @returns JSON response with the newly deleted Checkpoints::CheckpointCondition object
  def destroy
    @checkpoint_condition = Checkpoints::CheckpointCondition.find( params[:id] )

    respond_to do | format |
      if @checkpoint_condition.destroy
        format.json { render json: @checkpoint_condition }
      else
        format.json { render json: { errors: @checkpoint_condition.errors.full_messages, status: 422 } }
      end
    end
  end

end
