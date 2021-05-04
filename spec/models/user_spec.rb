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

    # xit "is not valid without first name" do
    # end

    # xit "is not valid without last name" do
    # end

    # xit "is not valid without email" do
    # end 

    # xit "is not valid without password field" do
    # end

    # xit "is not valid without password_confirmation field" do
    # end

    # xit "is not valid if password and passwor confirmation fields don't match" do
    # end

    # xit "should not be valid if email already exists in database" do
    # end

  end
end
