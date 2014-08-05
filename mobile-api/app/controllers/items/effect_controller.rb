class Items::EffectController < ApplicationController

  # Return all Items::Effect objects in the database
  #
  # @type    GET
  # @returns JSON response with all Items::Effect objects
  def index
    @effects = Items::Effect.all

    respond_to do | format |
      format.json { render json: @effects }
    end
  end


  # Return a single Items::Effect by a given id
  #
  # @type    GET
  # @param   id
  # @returns JSON response with a Items::Effect object
  def show
    @effect = Items::Effect.where( id:params[:id] ).all

    respond_to do | format |
      format.json { render json: @effect }
    end
  end


  # creates a new Items::Effect object
  #
  # @type    POST
  # @param   effect
  # @returns JSON response with the newly created Items::Effect object
  def create
    @effect = Items::Effect.new ( params[:items_effect] )

    respond_to do | format |
      if @effect.save
        format.json { render json: @effect }
      else
        format.json { render json: { errors: @effect.errors.full_messages, status: 422 } }
      end
    end
  end


  # updates a Items::Effect object based on id
  #
  # @type    PUT
  # @param   id
  # @param   effect
  # @returns JSON response with the newly updated Items::Effect object
  def update
    @effect = Items::Effect.where( id:params[:id] )

    respond_to do | format |
      if @effect.update_attributes ( params[:items_effect] )
        format.json { render json: @effect }
      else
        format.json { render json: { errors: @effect.errors.full_messages, status: 422 } }
      end
    end
  end


  # updates a Items::Effect object based on id
  #
  # @type    DELETE
  # @param   id
  # @returns JSON response with the newly deleted Items::Effect object
  def destroy
    @effect = Items::Effect.find( params[:id] )

    respond_to do | format |
      if @effect.destroy
        format.json { render json: @effect }
      else
        format.json { render json: { errors: @effect.errors.full_messages, status: 422 } }
      end
    end
  end

end
