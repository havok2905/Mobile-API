require_relative '../spec_helper'

describe Games::Game do

  before :each do
    @game = Games::Game.new
  end

  subject { @game }

  it { should have_many :checkpoints }
  it { should have_one :inventory }
  it { should belong_to :user }

  describe 'validations' do
    it 'should be valid' do
      binding.pry
        @game.should have(1).error_on :name
    end

    it 'should require a description' do
      @game.should have(1).error_on :description
    end

    it 'should require a latitude' do
      @game.should have(1).error_on :latitude
    end

    it 'should require a longitude' do
      @game.should have(1).error_on :longitude
    end
  end

end
