class HomeController < ApplicationController
  def index
    @categories = Category.roots
    @sponsored_products = Product.sponsored_products
    @hot_products = Product.hot_products
  end
end
