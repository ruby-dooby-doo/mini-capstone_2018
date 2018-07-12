class Supplier < ApplicationRecord
  def products
    # return the products for this particular supplier
    # id from this product
    # id
    # go to the products table and find those products
    Product.where(supplier_id: id)
  end
end
