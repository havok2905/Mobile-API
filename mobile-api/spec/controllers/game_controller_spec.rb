require_relative '../spec_helper'

describe Games::GameController, :type => :controller do

  def response_game_comparison game, game_response
    game_response['id'].should == game.id
    game_response['name'].should == game.name
    game_response['description'].should == game.description
    game_response['latitude'].should == game.latitude
    game_response['longitude'].should == game.longitude
  end


  it "should render successfully" do
    get :index, format: :json
    response.should be_success
  end


  before do
    request.env["HTTP_ACCEPT"] = 'application/json'
    @game_one = FactoryGirl.create(:game)
    @game_two = FactoryGirl.create(:game)
    @games = [@game_one, @game_two]
    @location_circle = { latitude: 28.594497999999998, longitude: -81.283683, range: 50 }
  end


  describe 'GET #index' do
    it "Responds with a valid array of games" do
      get :index
      @games_response = JSON.parse(response.body)
      response_game_comparison @game_one, @games_response.first
      response_game_comparison @game_two, @games_response.second
    end
  end


  describe 'GET #show' do
    it "Responds with a valid game" do
      get :show, id: @game_one.id
      @game_response = JSON.parse(response.body).first
      response_game_comparison @game_one, @game_response
    end
  end


  describe 'GET #get_by_location' do
    it "Responds with a valid list of games in range" do
      get :get_by_location, @location_circle
      @games_response = JSON.parse(response.body)
      response_game_comparison @game_one, @games_response.first
      response_game_comparison @game_two, @games_response.second
    end
  end
end
