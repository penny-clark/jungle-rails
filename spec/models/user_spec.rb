require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is valid with valid attibutes" do
      user = User.new(
        first_name: 'Egg',
        last_name: 'Eggerson',
        email: 'eggy@eggy.egg',
        password: 'Egg',
        password_confirmation: 'Egg'
      )
      expect(user).to be_valid
    end

    it "is not valid without first name" do
      user = User.new(
        first_name: nil,
        last_name: 'Eggerson',
        email: 'eggy@eggy.egg',
        password: 'Egg',
        password_confirmation: 'Egg'
      )
      expect(user).to_not be_valid
    end

    it "is not valid without last name" do
      user = User.new(
        first_name: 'Egg',
        last_name: nil,
        email: 'eggy@eggy.egg',
        password: 'Egg',
        password_confirmation: 'Egg'
      )
      expect(user).to_not be_valid
    end

    it "is not valid without email" do
      user = User.new(
        first_name: 'Egg',
        last_name: 'Eggerson',
        email: nil,
        password: 'Egg',
        password_confirmation: 'Egg'
      )
      expect(user).to_not be_valid
    end 

    it "is not valid without password field" do
      user = User.new(
        first_name: 'Egg',
        last_name: 'Eggerson',
        email: 'eggy@eggy.egg',
        password: nil,
        password_confirmation: 'Egg'
      )
      expect(user).to_not be_valid
    end

    it "is not valid without password_confirmation field" do
      user = User.new(
        first_name: 'Egg',
        last_name: 'Eggerson',
        email: 'eggy@eggy.egg',
        password: 'Egg',
        password_confirmation: nil
      )
      expect(user).to_not be_valid
    end

    it "is not valid if password and password confirmation fields don't match" do
      user = User.new(
          first_name: 'Egg',
          last_name: 'Eggerson',
          email: 'eggy@eggy.egg',
          password: 'Egg',
          password_confirmation: 'Eggs!!!!!'
        )
        expect(user).to_not be_valid
    end

    before { User.create!(
      first_name: 'Walty',
      last_name: 'Budd',
      email: 'walty@budd.com',
      password: 'Egg',
      password_confirmation: 'Egg'
    ) }

    it "should not be valid if email already exists in database" do
      user = User.new(
        first_name: 'Egg',
        last_name: 'Eggerson',
        email: 'walty@budd.com',
        password: 'Egg',
        password_confirmation: 'Egg'
      )
      expect(user).to_not be_valid
    end

    it "should not be valid if email already exists in database, not case sensitive" do
      user = User.new(
        first_name: 'Egg',
        last_name: 'Eggerson',
        email: 'WALTY@budd.COM',
        password: 'Egg',
        password_confirmation: 'Egg'
      )
      expect(user).to_not be_valid
    end

    it "should have a password at least three characters long" do
      user = User.new(
        first_name: 'Egg',
        last_name: 'Eggerson',
        email: 'eggy@eggy.egg',
        password: 'Eg',
        password_confirmation: 'Eg'
      )
      expect(user).to_not be_valid
    end
  end

  before { User.create!(
    first_name: 'Megg',
    last_name: 'Bartley',
    email: 'megg@bartley.com',
    password: 'Egg',
    password_confirmation: 'Egg'
  ) }

  describe '.authenticate_with_credentials' do
    it "should return user if info is valid" do
      user = User.find_by_email('megg@bartley.com')
      authenticate = User.authenticate_with_credentials('megg@bartley.com', 'Egg')

      expect(authenticate).to eq user
    end

    it "should return nil if email does not match" do
      user = User.find_by_email('megg@bartley.com')
      authenticate = User.authenticate_with_credentials('megg@egg.com', 'Egg')

      expect(authenticate).to eq nil
    end

    it "should return false if password is not valid" do
      user = User.find_by_email('megg@bartley.com')
      authenticate = User.authenticate_with_credentials('megg@bartley.com', 'Eggs!!!')

      expect(authenticate).to eq nil
    end
    
    it "should return user if info is valid even if there are extra spaces before or after email" do
      user = User.find_by_email('megg@bartley.com')
      authenticate = User.authenticate_with_credentials('   megg@bartley.com   ', 'Egg')

      expect(authenticate).to eq user
    end

    it "should return user if info is valid even if the case doesn't match" do
      user = User.find_by_email('megg@bartley.com')
      authenticate = User.authenticate_with_credentials('MEGG@bartley.COM', 'Egg')

      expect(authenticate).to eq user
    end
    
  end
end
