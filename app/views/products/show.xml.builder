xml.instruct!
xml.product :self => product_url(@product) do
  xml.code @product.code
  xml.description @product.description
  xml.price number_to_currency(@product.price, :unit => "£")
end
