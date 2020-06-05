class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    if params["query"].blank?
      @products = Product.all
    else
      @products = Product.where(category: params["query"])
    end
    @categories = [ "Shows", "Cinemas", "Festivais", "Cervejadas", "Outros"]
  end

  def show
    @user = User.find(current_user.id)
    @product = Product.where(user_id: @user.id)
  end

  def sales
    @sales = Cart.joins(:product).where(products: {user_id: current_user.id})
  end

  def orders
  	@orders = Cart.where(user: current_user)
  end

end
