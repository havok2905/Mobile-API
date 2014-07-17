require_relative '../spec_helper'

describe Games::User do

  before :each do
    @user = Games::User.new
  end

  subject { @user }

  it { should have_many :games }

  describe 'validations' do
    describe 'valid_password?' do
    end

    describe 'valid_email?' do
    end

    describe 'valid_username?' do
    end
  end
end
