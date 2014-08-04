class Games::Inventory < ApplicationController

  # Return all Games::Inventory objects in the database
  #
  # @type    GET
  # @returns JSON response with all Games::Inventory objects
  def index
    @inventory = Games::Inventory.all

    respond_to do | format |
      format.json { render json: @inventory }
    end
  end


  # Return a single Games::Inventory by a given id
  #
  # @type    GET
  # @param   id
  # @returns JSON response with a Games::Inventory object
  def show
    @inventory = Games::Inventory.where( id:params[:id] ).all

    respond_to do | format |
      format.json { render json: @inventory }
    end
  end


  # creates a new Games::Inventory object
  #
  # @type    POST
  # @param   inventory
  # @returns JSON response with the newly created Games::Inventory object
  def create
    @inventory = Games::Inventory.new ( params[:games_inventory] )

    respond_to do | format |
      if @inventory.save
        format.json { render json: @inventory }
      else
        format.json { render json: { errors: @inventory.errors.full_messages, status: 422 } }
      end
    end
  end


  # updates a Games::Inventory object based on id
  #
  # @type    PUT
  # @param   id
  # @param   inventory
  # @returns JSON response with the newly updated Games::Inventory object
  def update
    @inventory = Games::Inventory.where( id:params[:id] )

    respond_to do | format |
      if @inventory.update_attributes ( params[:games_inventory] )
        format.json { render json: @inventory }
      else
        format.json { render json: { errors: @inventory.errors.full_messages, status: 422 } }
      end
    end
  end


  # updates a Games::Game object based on id
  #
  # @type    DELETE
  # @param   id
  # @returns JSON response with the newly deleted Games::Inventory object
  def destroy
    @inventory = Games::Inventory.find( params[:id] )

    respond_to do | format |
      if @inventory.destroy
        format.json { render json: @inventory }
      else
        format.json { render json: { errors: @inventory.errors.full_messages, status: 422 } }
      end
    end
  end

end
