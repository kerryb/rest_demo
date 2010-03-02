class ProductsController < ApplicationController
  def index
    @products = Product.all
    response.content_type = "application/vnd.rest-example.products+xml"
    render :action => "index.xml.builder"
  end

  def show
    @product = Product.find params[:id]
    response.content_type = "application/vnd.rest-example.product+xml"
    render :action => "show.xml.builder"
  end
end
