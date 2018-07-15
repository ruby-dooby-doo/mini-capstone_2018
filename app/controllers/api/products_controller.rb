class Api::ProductsController < ApplicationController
  def index
    p '8' * 50
    p current_user
    p '8' * 50
    search_term = params[:search_name]
    @products = Product.where("LOWER(name) LIKE ?", "%#{search_term}%").order(params[:sort_by])
    render 'index.json.jbuilder'
  end

  def show
    product_id = params[:id]
    @product = Product.find(product_id)
    render 'show.json.jbuilder'
  end

  def create
    @product = Product.new(
                           name: params[:name],
                           price: params[:price],
                           description: params[:description],
                           supplier_id: params[:supplier_id]
                          )

    @product.save
    render 'show.json.jbuilder'
  end

  def update
    product_id = params[:id]
    @product = Product.find(product_id)
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description

    @product.save
    render 'show.json.jbuilder'
  end

  def destroy
    product_id = params[:id]
    @product = Product.find(product_id)
    @product.destroy
    render json: {message: "Product successfully destroyed"}
  end
end










