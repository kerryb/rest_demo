class ProductsController < ApplicationController
  def index
    @products = Product.all
    response.content_type = "application/vnd.rest-example.products+xml"
    render :action => "index.xml.builder"
  end
end
