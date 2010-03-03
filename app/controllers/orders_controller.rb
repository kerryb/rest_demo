class OrdersController < ApplicationController
  def index
    response.content_type = "application/vnd.rest-example.orders+xml"
    render :action => "index.xml.builder"
  end

  def create
    response.content_type = "application/vnd.rest-example.order+xml"
    render :action => "show.xml.builder", :status => 201
  end
end
