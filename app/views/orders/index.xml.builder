xml.instruct!
xml.orders do
  xml.link :rel => "latest", :method => "get", :href => orders_url
  xml.link :rel => "new", :method => "post",
    :type => "application/vnd.rest-example.order+xml", :href => orders_url
end
