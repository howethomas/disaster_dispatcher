require 'rss'
require 'open-uri'

class DashboardController < ApplicationController
  before_filter :login_required
  
  def index
    @rss = get_feeds
    @notes = Note.find(:all, :order => "created_at DESC", :limit => 10)
  end

  def get_feeds
    # What feed are we parsing?
    rss_feed = "http://twitter.com/statuses/user_timeline/58313.rss"

    # Variable for storing feed content
    rss_content = ""

    # Read the feed into rss_content
    open(rss_feed) do |f|
       rss_content = f.read
    end

    # Parse the feed, dumping its contents to rss
    rss = RSS::Parser.parse(rss_content, false)
  end
end


