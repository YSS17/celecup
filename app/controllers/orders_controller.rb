class OrdersController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @order = Order.new
  end

  def create
    @product = Product.find(params[:product_id])
    order = Order.new(orders_params)
    order.product = @product
    order.user = current_user
    order.save
    redirect_to root_path
  end

  def orders_params
    params.require(:order).permit(:quantity)
  end
end
