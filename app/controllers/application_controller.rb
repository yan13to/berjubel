class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include AuthenticatedSystem 
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

protected  
end
