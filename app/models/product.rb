class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 10..500 }

  # how can i test if these validations actually work?
  # when are the rules checked (when are the validations run)?

  def discounted?
    price < 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  # def supplier
  #   # return the supplier for this particular product
  #   # supplier_id from this product
  #   # supplier_id
  #   # go to the suppliers table and find that supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  # def images
  #   # go to the images table, get all the images with the product_id that is the same id as the image that images is being called on
  #   Image.where(product_id: id)
  # end
end
