require_relative '../spec_helper'

describe Items::ItemController, :type => :controller do

  it "should render successfully" do
    get :index, format: :json
    response.should be_success
  end

  before do
    request.env["HTTP_ACCEPT"] = 'application/json'
    @weapon = FactoryGirl.create(:weapon_item)
    @story = FactoryGirl.create(:story_item)
    @health = FactoryGirl.create(:health_item)

    @items = [ @weapon, @story, @health ]

  end

  describe 'POST #create_child_item' do
    it 'should create a new item based on the correct item type' do

    end
  end

  describe 'GET #weapons' do
    it 'should retrieve all weapon items' do
      get :weapons, format: :json
      JSON.parse(response.body).first["as_item_type"].should == "Items::WeaponItem"
    end
  end

  describe 'GET #health' do
    it 'should retrieve all health items' do
      get :health, format: :json
      JSON.parse(response.body).first["as_item_type"].should == "Items::HealthItem"
    end
  end

  describe 'GET #stories' do
    it 'should retrieve all story items' do
      get :stories, format: :json
      JSON.parse(response.body).first["as_item_type"].should == "Items::StoryItem"
    end
  end

end
