xml.instruct!
xml.store do
  xml.link :rel => "products", :method => "get", :href => products_url
  xml.link :rel => "orders", :method => "get", :href => orders_url
end
