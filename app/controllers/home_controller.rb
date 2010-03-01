class HomeController < ApplicationController
  def index
    response.content_type = "application/vnd.rest-example.home+xml"
    render :action => "index.xml.builder"
  end
end
