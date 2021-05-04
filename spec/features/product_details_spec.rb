require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  
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

  scenario "displays home page, click on a product details link, visit product detail page" do
      visit root_path
      save_screenshot 'home_page_test.png'
      click_link('Details', match: :first)
      
      sleep 1 
  
      save_screenshot 'product_info_page_test.png'
      expect(page).to have_css('section.products-show')

  end
end
