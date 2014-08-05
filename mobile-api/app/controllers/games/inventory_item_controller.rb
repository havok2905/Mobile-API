class Games::InventoryItem < ApplicationController

  # Return all Games::InventoryItem objects in the database
  #
  # @type    GET
  # @returns JSON response with all Games::InventoryItem objects
  def index
    @inventory_item = Games::InventoryItem.all

    respond_to do | format |
      format.json { render json: @inventory_item }
    end
  end


  # Return a single Games::InventoryItem by a given id
  #
  # @type    GET
  # @param   id
  # @returns JSON response with a Games::InventoryItem object
  def show
    @inventory_item = Games::InventoryItem.where( id:params[:id] ).all

    respond_to do | format |
      format.json { render json: @inventory_item }
    end
  end


  # creates a new Games::InventoryItem object
  #
  # @type    POST
  # @param   inventory_item
  # @returns JSON response with the newly created Games::InventoryItem object
  def create
    @inventory_item = Games::InventoryItem.new ( params[:games_inventory_item] )

    respond_to do | format |
      if @inventory_item.save
        format.json { render json: @inventory_item }
      else
        format.json { render json: { errors: @inventory_item.errors.full_messages, status: 422 } }
      end
    end
  end


  # updates a Games::InventoryItem object based on id
  #
  # @type    PUT
  # @param   id
  # @param   inventory_item
  # @returns JSON response with the newly updated Games::InventoryItem object
  def update
    @inventory_item = Games::InventoryItem.where( id:params[:id] )

    respond_to do | format |
      if @inventory_item.update_attributes ( params[:games_inventory_item] )
        format.json { render json: @inventory_item }
      else
        format.json { render json: { errors: @inventory_item.errors.full_messages, status: 422 } }
      end
    end
  end


  # updates a Games::InventoryItem object based on id
  #
  # @type    DELETE
  # @param   id
  # @returns JSON response with the newly deleted Games::InventoryItem object
  def destroy
    @inventory_item = Games::InventoryItem.find( params[:id] )

    respond_to do | format |
      if @inventory_item.destroy
        format.json { render json: @inventory_item }
      else
        format.json { render json: { errors: @inventory_item.errors.full_messages, status: 422 } }
      end
    end
  end

end
