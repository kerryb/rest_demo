class OrdersController < ApplicationController
  def index
    response.content_type = "application/vnd.rest-example.orders+xml"
    render :action => "index.xml.builder"
  end

  def create
    body = request.body.read(request.content_length)
    @order = Order.create_from_xml body
    if @order
      response.content_type = "application/vnd.rest-example.order+xml"
      response.headers["Location"] = order_url(@order)
      render :action => "show.xml.builder", :status => 201
    else
      render_error 400, "Failed to create order"
    end
  end

  def show
    @order = Order.find params[:id]
    response.content_type = "application/vnd.rest-example.order+xml"
    render :action => "show.xml.builder"
  end
end
