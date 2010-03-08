xml.instruct!
xml.order do
  xml.link :rel => "latest", :method => "get", :href => order_url(@order)
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
