class DrinksController < ApplicationController
  def index
    @drinks = Drink.all
    render 'index.html.erb'
  end

  def show
    @drink = Drink.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    drink = Drink.create(
      name: params[:name], 
      price: params[:price], 
      image: params[:image], 
      description: params[:description]
    )
    render 'create.html.erb'
  end

  def edit
    @drink = Drink.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @drink = Drink.find_by(id: params[:id])
    @drink.update(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description]
    )
    render 'update.html.erb'
  end

  def destroy
    @drink = Drink.find_by(id: params[:id])
    @drink.destroy
    render 'destroy.html.erb'
  end
end

