require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

  scenario "when user clicks 'add to cart' button, their cart count goes up by one" do
    visit root_path
    save_screenshot 'add_to_cart_test_before.png'
    expect(page).to have_text('My Cart (0)')
    click_on('Add', match: :first)
      
    sleep 1 
  
    save_screenshot 'add_to_cart_test_after.png'
    expect(page).to have_text('My Cart (1)')
  end
end
