class OrdersController < ApplicationController
  def create
    @drink = Drink.find_by(id: params[:id])
    subtotal = params[:subtotal].to_f * params[:quantity].to_f
    tax = params[:tax].to_f * params[:quantity].to_f
    total = params[:total].to_f * params[:quantity].to_f
    @order = Order.new(
      user_id: current_user.id,
      quantity: params[:quantity],
      product_id: params[:id],
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    @order.save
    flash[:success] = 'Product ordered!'
    render 'show.html.erb'
  end
end
