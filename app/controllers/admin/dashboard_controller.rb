class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']
  def show
    @products_count = Product.count
    @categories_count = Category.count
  end

  # def products_count
  #   @products_count = Product.count
  # end
  # helper_method :products_count

  # def catagories_count
  #   @catagories_count = Catagory.all.count
  # end
  # helper_method :catagories_count

end
