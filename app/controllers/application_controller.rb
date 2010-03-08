# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  #protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def render_error status, message
    response.content_type = "application/vnd.rest-example.error+xml"
    @message = message
    render :template => "/error.xml.builder", :status => status, :layout => false
  end  
end
