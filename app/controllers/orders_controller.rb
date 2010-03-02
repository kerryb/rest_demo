class OrdersController < ApplicationController
  def index
    response.content_type = "application/vnd.rest-example.orders+xml"
    render :action => "index.xml.builder"
  end
end
