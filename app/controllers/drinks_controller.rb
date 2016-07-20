class DrinksController < ApplicationController
  def index
    if params[:sort] && params[:order]
      @drinks = Drink.order(params[:sort] => params[:order])
    else
      @drinks = Drink.order(:created_at)
    end
    render 'index.html.erb'
  end

  def show
    @drink = Drink.find_by(id: params[:id])
    @images = @drink.images
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    drink = Drink.create(
      name: params[:name], 
      price: params[:price],  
      description: params[:description],
      in_stock: true
    )
    flash[:success] = "Drink successfully <strong>created</strong>!"
    redirect_to "/drinks/#{drink.id}"
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
    flash[:info] = "Drink successfully <strong>updated</strong>!"
    redirect_to "/drinks/#{@drink.id}"
  end

  def destroy
    @drink = Drink.find_by(id: params[:id])
    @drink.destroy
    flash[:danger] = "Drink successfully <strong>deleted</strong>..."
    redirect_to "/drinks"
  end

  def discount
    @drinks = Drink.where("price < ?", 2.00)
    render 'index.html.erb'
  end

  def add_image
    @drink = Drink.find_by(id: params[:id])
    render 'add_image.html.erb'
  end
end

