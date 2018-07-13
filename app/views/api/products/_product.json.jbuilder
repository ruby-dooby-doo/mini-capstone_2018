json.id product.id
json.name product.name
json.price product.price
json.description product.description
json.formatted do
  json.discounted product.discounted?
  json.tax product.tax
  json.total product.total
end
json.supplier product.supplier
json.images product.images
