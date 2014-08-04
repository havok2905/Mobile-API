class Checkpoints::CheckpointAssociationController < ApplicationController

  # Return all Checkpoints::CheckpointAssociation objects in the database
  #
  # @type    GET
  # @returns JSON response with all Checkpoints::CheckpointAssociation objects
  def index
    @checkpoint_associations = Checkpoints::CheckpointAssociation.all

    respond_to do | format |
      format.json { render json: @checkpoint_associations }
    end
  end


  # Return a single Checkpoints::CheckpointAssociation by a given id
  #
  # @type    GET
  # @param   id
  # @returns JSON response with a Checkpoints::CheckpointAssociation object
  def show
    @checkpoint_association = Checkpoints::CheckpointAssociation.where( id:params[:id] ).all

    respond_to do | format |
      format.json { render json: @checkpoint_association }
    end
  end


  # creates a new Checkpoints::CheckpointAssociation object
  #
  # @type    POST
  # @param   checkpoint_association
  # @returns JSON response with the newly created Checkpoints::CheckpointAssociation object
  def create
    @checkpoint_association = Checkpoints::CheckpointAssociation.new ( params[:checkpoints_checkpoint_association] )

    respond_to do | format |
      if @checkpoint_association.save
        format.json { render json: @checkpoint_association }
      else
        format.json { render json: { errors: @checkpoint_association.errors.full_messages, status: 422 } }
      end
    end
  end


  # updates a Checkpoints::CheckpointAssociation object based on id
  #
  # @type    PUT
  # @param   id
  # @param   checkpoint_association
  # @returns JSON response with the newly updated Checkpoints::CheckpointAssociation object
  def update
    @checkpoint_association = Checkpoints::CheckpointAssociation.where( id:params[:id] )

    respond_to do | format |
      if @checkpoint_association.update_attributes ( params[:checkpoints_checkpoint_association] )
        format.json { render json: @checkpoint_association }
      else
        format.json { render json: { errors: @checkpoint_association.errors.full_messages, status: 422 } }
      end
    end
  end


  # updates a Checkpoints::CheckpointAssociation object based on id
  #
  # @type    DELETE
  # @param   id
  # @returns JSON response with the newly deleted Checkpoints::CheckpointAssociation object
  def destroy
    @checkpoint_association = Checkpoints::CheckpointAssociation.find( params[:id] )

    respond_to do | format |
      if @checkpoint_association.destroy
        format.json { render json: @checkpoint_association }
      else
        format.json { render json: { errors: @checkpoint_association.errors.full_messages, status: 422 } }
      end
    end
  end

end
