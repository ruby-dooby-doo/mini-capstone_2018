class Api::OrdersController < ApplicationController
  def show
    # grab the id from the params
    order_id = params[:id]
    # get the correct order from the db based on the params
    # @order = Order.find(params[:id])
    @order = Order.find_by(id: order_id)
    render "show.json.jbuilder"
  end

  def create
    product = Product.find_by(id: params[:product_id])
    p "product"
    p product
    p "quantity"
    p params[:quantity]
    p "product price"
    p product.price
    p product.price.to_s

    calculated_subtotal = params[:quantity].to_i * product.price
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_tax + calculated_subtotal
    p calculated_subtotal
    p calculated_tax
    p calculated_total

    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    @order.save
    render "show.json.jbuilder"
  end
end
