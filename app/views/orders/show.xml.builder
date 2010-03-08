xml.instruct!
xml.order do
  xml.link :rel => "latest", :method => "get", :href => order_url(@order)
  xml.link :rel => "cancel", :method => "delete", :href => order_url(@order)
  xml.link :rel => "pay", :method => "post",
    :type => "application/vnd.rest-example.payment-details+xml",
    :href => order_url(@order) + "/pay" #FIXME Generate URL when action exists
  @order.order_lines.each do |line|
    xml.line do
      xml.product product_url(line.product)
      xml.quantity line.quantity
      xml.cost number_to_currency(line.quantity * line.product.price, :unit => "")
    end
  end
  total = @order.order_lines.inject(0) {|total, line| total + line.product.price * line.quantity}
  xml.total number_to_currency(total, :unit => "")
end
