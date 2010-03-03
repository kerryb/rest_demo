xml.instruct!
xml.product do
  xml.link :rel => "latest", :method => "get", :href => product_url(@product)
  xml.code @product.code
  xml.description @product.description
  xml.price number_to_currency(@product.price, :unit => "")
end
