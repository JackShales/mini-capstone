class CartedProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart = User.find_by(id: current_user.id).carted_products
    if @cart.where(status: "carted").empty?
      flash[:info] = 'No items in cart...'
      redirect_to '/'
    else
      render 'index.html.erb'
    end
  end

  def create
    cart = CartedProduct.new(
      user_id: current_user.id,
      drink_id: params[:id],
      quantity: params[:quantity],
      status: "carted"
    )
    cart.save
    flash[:success] = 'Item added to cart!'
    redirect_to '/cart'
  end

  def destroy
    item = CartedProduct.find_by(id: params[:product_id])
    item.update(status: "removed")
    flash[:danger] = 'Item removed from cart...'
    redirect_to '/cart'
  end
end
