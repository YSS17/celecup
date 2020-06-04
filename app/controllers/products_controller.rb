class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    @product.save
    redirect_to root_path
  end

  def new
    @product = Product.new
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to product_path
  end

  def update
    @product = Product.find(params[:id])
    @product.update(params[:product])
    redirect_to product_path(@product)
  end

private

  def product_params
    params.require(:product).permit(:title, :category, :price, :quantity)
  end
end
