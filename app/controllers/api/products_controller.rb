class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    # search_term = params[:search_name]
    # @products = Product.where("LOWER(name) LIKE ?", "%#{search_term}%").order(params[:sort_by])
    if params[:category]
      # get me only the items from that category
      # find all the products for a particular category
      category = Category.find_by(name: params[:category])
      p 'category'
      p category
      @products = category.products
    else
      @products = Product.all
    end
    render 'index.json.jbuilder'
  end

  def show
    product_id = params[:id]
    @product = Product.find(product_id)
    render 'show.json.jbuilder'
  end

  def create
    # only an admin can do this
    @product = Product.new(
                           name: params[:name],
                           price: params[:price],
                           description: params[:description],
                           supplier_id: params[:supplier_id]
                          )

    if @product.save
      render 'show.json.jbuilder'
    else # sad path
      # what should i do here?
      # json.errors @product.errors.full_messages
      render json: {errors: @product.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def update
    product_id = params[:id]
    @product = Product.find(product_id)
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description

    if @product.save
      render 'show.json.jbuilder'
    else
      # send back the errors
      render json: {errors: @product.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def destroy
    product_id = params[:id]
    @product = Product.find(product_id)
    @product.destroy
    render json: {message: "Product successfully destroyed"}
  end
end










