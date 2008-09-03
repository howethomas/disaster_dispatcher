require 'rss'
require 'open-uri'
require 'rest_client'

class DashboardController < ApplicationController
  before_filter :login_required
  
  def index
    options = Option.find_by_user_id(current_user.id)
    if options.nil?
      redirect_to :controller=>"options", :action =>"new"
    else
      unless options.news_feed.empty?
        @rss = get_feeds(options.news_feed)
      else
        @rss = get_feeds("http://news.google.com/news?ned=us&output=rss")
      end
      @notes = Note.find(:all, :order => "created_at DESC", :limit => 10)
    
      o = Option.find_by_user_id(current_user.id)
      @public_feed = Twitter::Base.new(o.twitter_user,o.twitter_pass).timeline(:friends)
      @note = Note.new
    end
  end

  def call
    @screen_name = params[:id]
    contact = Contact.find_by_screen_name(@screen_name.downcase)
    o = Option.find_by_user_id(current_user.id)
    
    if o.bw_user.empty? or o.bw_pass.empty? or o.bw_server.empty? 
      flash[:error] = "Cannot create call - incomplete broadsoft setup. Fix in Application Options"
      redirect_to :action => "index"
      return
    end
    if contact.cell.nil? or contact.cell.empty?
      flash[:error] = "Cannot create call - no cell phone defined for user"
    else
      begin
        resource = RestClient::Resource.new("http://#{o.bw_server}/com.broadsoft.xsi-actions/v1.0/user/howethomasUser1@xdp.broadsoft.com", o.bw_user, o.bw_pass)
        resource["calls/new/#{contact.cell}"].post "hello"
        flash[:notice] = "Call made"                
      rescue Exception => e
        flash[:error] = "Cannot create call - probably an authorization issue with the call server. Fix in Application Options"
      end
      redirect_to :action => "index"
    end
  end
  
  
  
  def get_feeds(news_feed)
     # Variable for storing feed content
    rss_content = ""

    # Read the feed into rss_content
    open(news_feed) do |f|
       rss_content = f.read
    end

    # Parse the feed, dumping its contents to rss
    rss = RSS::Parser.parse(rss_content, false)
  end
end


