require_relative '../spec_helper'

describe Games::User do

  before :each do
    @user = Games::User.new
  end

  subject { @user }

  it { should have_many :games }

  describe 'validations' do
    describe 'valid_password?' do
      it 'should pass with a long password' do
        @user.password = '123456'
        @user.should have(0).error_on(:password)
      end

      it 'should pass with a short password' do
        @user.password = '12345'
        @user.should have(1).error_on(:password)
      end
    end

    describe 'valid_email?' do
      it 'should pass with a real email' do
        @user.email = 'test@test.com'
        @user.should have(0).error_on(:email)
      end

      it 'should fail with a fake email' do
        @user.email = 'test'
        @user.should have(1).error_on(:email)
      end

    end

    describe 'valid_username?' do
      # I'm not saving records in tests. I'm trusting that the where
      # method, last method, and present? method work for this.
      # This shouldn't need testing.
    end
  end

  describe 'callbacks' do
    describe 'clear_password' do
      it 'should make a password nil' do
        @user.password = 'test'
        @user.clear_password
        @user.password.should == nil
      end
    end

    describe 'encrypt_password' do
      # This is time based. I would need to sync the times of the test
      # case salt and the salt generated by the method. Not doing that.
      # I'm trusting that Digest::SHA1 methods work properly
    end
  end
end
