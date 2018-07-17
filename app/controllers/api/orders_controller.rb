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
    p "*" * 50
    p current_user
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity]
    )
    @order.save
    render "show.json.jbuilder"
  end
end
