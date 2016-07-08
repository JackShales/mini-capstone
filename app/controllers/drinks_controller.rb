class DrinksController < ApplicationController
  def all_products
    @drinks = Drink.all
    render 'home.html.erb'
  end

  def cold_brew
    @cold_brew = Drink.first
    render 'cold_brew.html.erb'
  end

  def decaf_cold_brew
    @decaf_cold_brew = Drink.second
    render 'decaf_cold_brew.html.erb'
  end

  def black_tea
    @black_tea = Drink.third
    render 'black_tea.html.erb'
  end
end

