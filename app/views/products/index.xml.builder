xml.instruct!
xml.products(:self => products_url) do
  @products.each do |product|
    xml.product do
      xml.link :rel => "view", :method => "get", :href => product_url(product)
      xml.code product.code
      xml.description product.description
      xml.price number_to_currency(product.price, :unit => "")
    end
  end
end
