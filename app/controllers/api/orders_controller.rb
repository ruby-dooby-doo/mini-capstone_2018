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
    @carted_products = current_user.carted_products.where(status: 'carted')

    calculated_subtotal = 0
    @carted_products.each do |carted_product|
      calculated_subtotal += carted_product.product.price * carted_product.quantity
    end

    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_tax + calculated_subtotal

    # calculated_subtotal = params[:quantity].to_i * product.price

    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    @order.save

    @carted_products.each do |carted_product|
      carted_product.status = 'purchased'
      carted_product.order_id = @order.id
      carted_product.save

      # carted_product.update(status: 'purchased', order_id: @order.id)
    end
    render "show.json.jbuilder"
  end
end
