# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  
  require 'rubygems'
  require 'twitter'
  require 'time'
  
  
  
  #before_filter :check_options, :unless => :create
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'e1a41b96129ae88196bf6c6765d8814c'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  private
  def check_options
    if logged_in?
      options = Option.find_by_user_id(current_user.id)
      if options.nil?
        options = Option.new
        options.user_id = User.find(current_user.id)
        options.save
        redirect_to :controller=> "options", :action => "edit", :id => options.id
      end
    end    
  end
  
end
