require 'unirest'

# Products index action
# response = Unirest.get('http://localhost:3000/api/products')
# data = response.body

# puts JSON.pretty_generate(data)


# Products show action
# product_id = 1
# response = Unirest.get("http://localhost:3000/api/products/#{product_id}")
# product_hash = response.body
# puts JSON.pretty_generate(product_hash)

# params = {
#   name: "cake",
#   price: 15,
#   description: "it's fluffy",
#   image_url: "https://steamuserimages-a.akamaihd.net/ugc/702859018936863904/9CFFCAE0B43E606BDE719C935496FA8CE260BF19/?interpolation=lanczos-none&output-format=jpeg&output-quality=95&fit=inside%7C512%3A320&composite-to=*,*%7C512%3A320&background-color=black"
# }

# response = Unirest.post("http://localhost:3000/api/products", parameters: params)
# product_hash = response.body
# puts JSON.pretty_generate(product_hash)

# Recipes update action
product_id = 5
params = {
  description: "it's so fluffy I'm gonna die!!!"
}
response = Unirest.patch("http://localhost:3000/api/products/#{product_id}", parameters: params)
product = response.body
puts JSON.pretty_generate(product)

# Product destroy action
# product_id = 3
# response = Unirest.delete("http://localhost:3000/api/products/#{product_id}")
# data = response.body
# puts JSON.pretty_generate(data)











