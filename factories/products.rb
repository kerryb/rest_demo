Factory.sequence :code do |n|
  "Product #{n}"
end

Factory.define :product do |product|
  product.code {Factory.next :code}
  product.description {|p| "Product #{p.code}"}
  product.price 1.20
end

Factory.define :product_foo, :parent => :product do |product|
  product.code "foo"
  product.description "Product Foo"
  product.price 1.00
end

Factory.define :product_bar, :parent => :product do |product|
  product.code "bar"
  product.description "Product Bar"
  product.price 2.50
end
