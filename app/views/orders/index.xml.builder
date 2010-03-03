xml.instruct!
xml.orders(:self => orders_url) do
  xml.link :rel => "new", :method => "post",
    :type => "application/vnd.rest-example.order+xml", :href => orders_url
end
