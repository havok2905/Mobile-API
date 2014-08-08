class Items::ItemController < ApplicationController

  # Return all Items::Item objects in the database
  #
  # @type    GET
  # @returns JSON response with all Items::Item objects and children
  def index
    @items = Items::Item.all

    respond_to do | format |
      format.json { render json: @items }
    end
  end


  # Return all Items::WeaponItem objects in the database
  #
  # @type    GET
  # @returns JSON response with all Items::WeaponItem objects and children
  def weapons
    @items = Items::Item.weapons.all

    respond_to do | format |
      format.json { render json: @items }
    end
  end


  # Return all Items::HealthItem objects in the database
  #
  # @type    GET
  # @returns JSON response with all Items::HealthItem objects and children
  def health
    @items = Items::Item.health.all

    respond_to do | format |
      format.json { render json: @items }
    end
  end


  # Return all Items::StoryItem objects in the database
  #
  # @type    GET
  # @returns JSON response with all Items::StoryItem objects and children
  def weapons
    @items = Items::Item.stories.all

    respond_to do | format |
      format.json { render json: @items }
    end
  end


  # Return a single Items::Item by a given id
  #
  # @type    GET
  # @param   id
  # @returns JSON response with a Items::Item object
  def show
    @item = Items::Item.where( id:params[:id] ).all

    respond_to do | format |
      format.json { render json: @item }
    end
  end


  # creates a new Items::Item object
  #
  # @type    POST
  # @param   item
  # @returns JSON response with the newly created Items::Item object
  def create
    @item = Items::Item.new ( params[:items_item] )

    respond_to do | format |
      if @item.save
        format.json { render json: @item }
      else
        format.json { render json: { errors: @item.errors.full_messages, status: 422 } }
      end
    end
  end


  # creates a new Items::Item child object
  #
  # @type    POST
  # @param   item
  # @param   item_type
  # @returns JSON response with the newly created Items::Item child object
  def create_child_item
    if Items::Item.item_typs.include? params[:item_type] do
      item = "Items::#{params[:item_type]}Item".constantize
      @item = item.new (params[:items_item])

      respond_to do | format |
        if @item.save
          format.json { render json: @item }
        else
          format.json { render json: { errors: @item.errors.full_messages, status: 422 } }
        end
      end
    else
      @item = Item::Items.new
      @item.errors.add(:name, "Not a valid item type")

      respond_to do | format |
        format.json { render json: { errors: @item.errors.full_messages, status: 422 } }
      end
    end
  end


  # updates a Items::Item object based on id
  #
  # @type    PUT
  # @param   id
  # @param   item
  # @returns JSON response with the newly updated Items::Item object
  def update
    @item = Items::Item.where( id:params[:id] )

    respond_to do | format |
      if @item.update_attributes ( params[:items_item] )
        format.json { render json: @item }
      else
        format.json { render json: { errors: @item.errors.full_messages, status: 422 } }
      end
    end
  end


  # updates a Items::Item object based on id
  #
  # @type    DELETE
  # @param   id
  # @returns JSON response with the newly deleted Items::Item object
  def destroy
    @item = Items::Item.find( params[:id] )

    respond_to do | format |
      if @item.destroy
        format.json { render json: @item }
      else
        format.json { render json: { errors: @item.errors.full_messages, status: 422 } }
      end
    end
  end
end
