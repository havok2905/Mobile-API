require_relative '../spec_helper'

describe Checkpoints::CheckpointController, :type => :controller do

  def response_checkpoint_comparison checkpoint, checkpoint_response
    checkpoint_response['id'].should == checkpoint.id
    checkpoint_response['name'].should == checkpoint.name
    checkpoint_response['description'].should == checkpoint.description
    checkpoint_response['latitude'].should == checkpoint.latitude
    checkpoint_response['longitude'].should == checkpoint.longitude
    checkpoint_response['followed'].should == checkpoint.followed

    # This drops the UTC from that datetime string. This is hacky, but it works. 
    checkpoint_response['last_visited'].to_datetime.should == checkpoint.last_visited.to_s

    checkpoint_response['game_id'].should == checkpoint.game_id
  end


  it "should render successfully" do
    get :index, format: :json
    response.should be_success
  end


  before do
    request.env["HTTP_ACCEPT"] = 'application/json'

    @game = FactoryGirl.create(:game)

    @checkpoint_one = FactoryGirl.create(:checkpoint)
    @checkpoint_one.update_column(:game_id, 1)

    @checkpoint_two = FactoryGirl.create(:checkpoint)
    @checkpoint_two.update_column(:game_id, 1)
    @checkpoint_two.update_column(:last_visited, 1.day.ago.to_datetime)

    @checkpoints = [@checkpoint_one, @checkpoint_two]

    @association = FactoryGirl.create(:association, checkpoints: @checkpoints)
  end


  describe 'GET #index' do
    it "Responds with a valid array of checkpoints" do
      get :index
      @checkpoints_response = JSON.parse(response.body)
      response_checkpoint_comparison @checkpoint_one, @checkpoints_response.first
      response_checkpoint_comparison @checkpoint_two, @checkpoints_response.last
    end
  end


  describe 'GET #show' do
    it "Responds with a valid checkpoint" do
      get :show, id: @checkpoint_one.id
      @checkpoint_response = JSON.parse(response.body).first
      response_checkpoint_comparison @checkpoint_one, @checkpoint_response
    end
  end


  describe 'GET #get_checkpoints_by_game' do
    it "Responds with valid checkpoints" do
      get :get_checkpoints_by_game, game_id: @game.id
      @checkpoint_response = JSON.parse(response.body)
      response_checkpoint_comparison @checkpoint_one, @checkpoint_response.first
      response_checkpoint_comparison @checkpoint_two, @checkpoint_response.last
    end
  end


  describe 'GET #get_checkpoints_by_location' do
    it "Responds with valid checkpoint" do
      get :get_checkpoints_by_location, latitude: 28.600000, longitude: -81.339235
      @checkpoint_response = JSON.parse(response.body)
      response_checkpoint_comparison @checkpoint_one, @checkpoint_response.first
      response_checkpoint_comparison @checkpoint_two, @checkpoint_response.last
    end
  end


  describe 'GET #get_possible_next_checkpoints' do
    it "Responds with valid checkpoints" do
      get :get_possible_next_checkpoints, id: @checkpoint_one.id
      @checkpoint_response = JSON.parse(response.body)
      response_checkpoint_comparison @checkpoint_two, @checkpoint_response.first
    end
  end


  describe 'GET #get_previous_checkpoint' do
    it "Responds with a valid checkpoint" do
      get :get_previous_checkpoint, game_id: 1
      @checkpoint_response = JSON.parse(response.body)
      response_checkpoint_comparison @checkpoint_two, @checkpoint_response.first
    end
  end


  describe 'POST #create' do
  end


  describe 'PUT #update' do
  end


  describe 'DELETE #destroy' do
  end
end
