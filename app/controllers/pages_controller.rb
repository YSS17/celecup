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
end
