class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @products = Product.all
  end

  def new 
    @product = Product.new
  end

  def create  
    @product = Product.new(product_params)
    @product.save

    redirect_to pages_path
  end

  private 

  def product_params  
    params.require(:product).permit(:name, :tagline)
  end
end
