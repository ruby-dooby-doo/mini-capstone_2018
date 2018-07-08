json.id product.id
json.name product.name
json.price product.price
json.image_url product.image_url
json.description product.description
json.formatted do
  json.discounted product.discounted?
  json.tax product.tax
  json.total product.total
end
