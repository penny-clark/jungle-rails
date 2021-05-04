require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "is valid with valid attributes" do
      category = Category.new(name: 'Apparel')
      product = Product.new(
        name:  'Men\'s Classy shirt',
        description: "blah blah blah",
        category: category,
        quantity: 10,
        price: 64.99
      )
      expect(product).to be_valid
    end

    # validates :name, prescence: true
    it "is not valid without a name" do
      category = Category.new(name: 'Apparel')
      product = Product.new(
        name: nil,
        description: "blah blah blah",
        category: category,
        quantity: 10,
        price: 64.99
      )
      expect(product).to_not be_valid
    end

    # validates :price, presence: true
    it "is not valid without a price" do
      category = Category.new(name: 'Apparel')
      product = Product.new(
        name:  'Men\'s Classy shirt',
        description: "blah blah blah",
        category: category,
        quantity: 10,
        price: nil
      )
      expect(product).to_not be_valid
    end

    #validates :quantity, presence: true
    it "is not valid without a quantity" do
      category = Category.new(name: 'Apparel')
      product = Product.new(
        name:  'Men\'s Classy shirt',
        description: "blah blah blah",
        category: category,
        quantity: nil,
        price: 64.99
      )
      expect(product).to_not be_valid
    end

    # validates :category, precense :true
    it "is not valid without a category" do
      category = Category.new(name: 'Apparel')
      product = Product.new(
        name:  'Men\'s Classy shirt',
        description: "blah blah blah",
        category: nil,
        quantity: 10,
        price: 64.99
      )
      expect(product).to_not be_valid
    end
  end
end
