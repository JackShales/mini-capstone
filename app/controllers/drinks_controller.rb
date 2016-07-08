class DrinksController < ApplicationController
  def all_products
    @drinks = Drink.all
    render 'home.html.erb'
  end
end

