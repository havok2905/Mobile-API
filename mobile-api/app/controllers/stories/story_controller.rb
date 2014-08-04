class Stories::StoryController < ApplicationController

  # Return all Stories::Story objects in the database
  #
  # @type    GET
  # @returns JSON response with all Stories::Story objects
  def index
    @stories = Stories::Story.all

    respond_to do | format |
      format.json { render json: @stories }
    end
  end


  # Return a single Stories::Story by a given id
  #
  # @type    GET
  # @param   id
  # @returns JSON response with a Stories::Story object
  def show
    @story = Stories::Story.where( id:params[:id] ).all

    respond_to do | format |
      format.json { render json: @story }
    end
  end


  # creates a new Stories::Story object
  #
  # @type    POST
  # @param   story
  # @returns JSON response with the newly created Stories::Story object
  def create
    @story = Stories::Story.new ( params[:stories_story] )

    respond_to do | format |
      if @story.save
        format.json { render json: @story }
      else
        format.json { render json: { errors: @story.errors.full_messages, status: 422 } }
      end
    end
  end


  # updates a Stories::Story object based on id
  #
  # @type    PUT
  # @param   id
  # @param   story
  # @returns JSON response with the newly updated Stories::Story object
  def update
    @story = Stories::Story.where( id:params[:id] )

    respond_to do | format |
      if @story.update_attributes ( params[:stories_story] )
        format.json { render json: @story }
      else
        format.json { render json: { errors: @story.errors.full_messages, status: 422 } }
      end
    end
  end


  # updates a Stories::Story object based on id
  #
  # @type    DELETE
  # @param   id
  # @returns JSON response with the newly deleted Stories::Story object
  def destroy
    @story = Stories::Story.find( params[:id] )

    respond_to do | format |
      if @story.destroy
        format.json { render json: @story }
      else
        format.json { render json: { errors: @story.errors.full_messages, status: 422 } }
      end
    end
  end

end
