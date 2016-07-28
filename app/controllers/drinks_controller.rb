class DrinksController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :discount, :run_search]

  def index
    if params[:sort] && params[:order]
      @drinks = Drink.order(params[:sort] => params[:order])
    elsif params[:category]
      @drinks = Category.find_by(name: params[:category]).drinks
    elsif params[:search_terms]
      @drinks = Drink.where("name LIKE ?", "%#{params[:search_terms].capitalize}%")
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
    @drink = Drink.new
    @image = Image.new
    render 'new.html.erb'
  end

  def create
    @drink = Drink.new(
      name: params[:name], 
      price: params[:price],  
      description: params[:description],
      supplier_id: params[:supplier_id],
      in_stock: true
    )
    if @drink.save
      @image = Image.new(
        drink_id: @drink.id,
        url: params[:image_url]
      )
    end
   
    if @image
      @image.save
      flash[:success] = "Drink successfully <strong>created</strong>!"
      redirect_to "/drinks/#{@drink.id}"
    else
      @image = Image.new
      render 'new.html.erb'
    end
  end

  def edit
    @drink = Drink.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @drink = Drink.find_by(id: params[:id])
    if @drink.update(
      name: params[:name],
      price: params[:price],
      description: params[:description]
    )
      flash[:info] = "Drink successfully <strong>updated</strong>!"
      redirect_to "/drinks/#{@drink.id}"
    else
      render 'edit.html.erb'
    end
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

  def run_search
    @products = Product.where("name LIKE ?", "%#{params[:search_terms]}%")
    render 'index.html.erb'
  end
end

