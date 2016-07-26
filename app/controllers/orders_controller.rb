class OrdersController < ApplicationController
  def create
    @cart = current_user.carted_products.where(status: "carted")

    subtotal = 0
    tax = 0
    total = 0

    @cart.each do |item|
      drink = Drink.find_by(id: item.drink_id)

      sb = drink.price * item.quantity
      tx = drink.tax * item.quantity
      ttl = sb + tx
      subtotal = subtotal + sb
      tax = tax + tx
      total = total + ttl
    end

    @order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    @order.save

    @cart.each do |item|
      item.update(status: "purchased", order_id: @order.id)
    end

    flash[:success] = 'Drinks ordered!'
    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    @bought = current_user.carted_products.where(order_id: @order.id)
    render 'show.html.erb'
  end
end

