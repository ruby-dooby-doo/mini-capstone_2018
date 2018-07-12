class Product < ApplicationRecord
  def discounted?
    price < 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def supplier
    # return the supplier for this particular product
    # supplier_id from this product
    # supplier_id
    # go to the suppliers table and find that supplier
    Supplier.find_by(id: supplier_id)
  end
end
