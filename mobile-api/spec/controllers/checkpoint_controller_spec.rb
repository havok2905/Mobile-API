require_relative '../spec_helper'

describe Checkpoints::CheckpointController, :type => :controller do

  def response_checkpoint_comparison checkpoint, checkpoint_response
    checkpoint_response['id'].should == checkpoint.id
    checkpoint_response['name'].should == checkpoint.name
    checkpoint_response['description'].should == checkpoint.description
    checkpoint_response['latitude'].should == checkpoint.latitude
    checkpoint_response['longitude'].should == checkpoint.longitude
    checkpoint_response['followed'].should == checkpoint.followed
    checkpoint_response['last_visited'].to_datetime.should == checkpoint.last_visited
    checkpoint_response['game_id'].should == checkpoint.game_id
  end


  it "should render successfully" do
    get :index, format: :json
    response.should be_success
  end


  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
    @game = FactoryGirl.create(:game)
    @checkpoint_one = FactoryGirl.create(:checkpoint)
    @checkpoint_two = FactoryGirl.create(:checkpoint)
    @checkpoints = [@checkpoint_one, @checkpoint_two]
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


  describe 'GET #get_checkpoint_by_game' do
    it "Responds with a valid checkpoint" do
      get :show, id: @checkpoint_one.id
      @checkpoint_response = JSON.parse(response.body).first
      response_checkpoint_comparison @checkpoint_one, @checkpoint_response
    end
  end


  describe 'POST #create' do
  end


  describe 'PUT #update' do
  end


  describe 'DELETE #destroy' do
  end
end
