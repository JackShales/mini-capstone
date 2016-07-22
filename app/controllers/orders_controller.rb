class OrdersController < ApplicationController
  def create
    @drink = Drink.find_by(id: params[:id])
    subtotal = @drink.price * params[:quantity].to_f
    tax = @drink.tax * params[:quantity].to_f
    total = @drink.total * params[:quantity].to_f

    @order = Order.new(
      user_id: current_user.id,
      quantity: params[:quantity],
      drink_id: params[:id],
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    @order.save
    flash[:success] = 'Product ordered!'
    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.html.erb'
  end
end

