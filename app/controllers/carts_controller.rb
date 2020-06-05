class CartsController < ApplicationController
  def create
    @cart = Cart.new
    @product = Product.find(params[:product_id])
    @cart.product = @product
    @cart.user = current_user
    @cart.save
    redirect_to @cart
  end

  def show
    @cart = Cart.find(params[:id])
  end
end
