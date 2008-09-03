class Option < ActiveRecord::Base

  def validate
    unless news_feed.empty?
      begin
        rss_content = ""
      
        # Check the RSS feeds
        open(news_feed) do |f|
           rss_content = f.read
        end
        # Parse the feed, dumping its contents to rss
        rss = RSS::Parser.parse(rss_content, false)
        if rss.nil? || rss.items.size == 0
          errors.add(news_feed)
        end      
      rescue Exception => e
        errors.add(news_feed)
      end
    else
      news_feed = "http://news.google.com/news?ned=us&output=rss"
    end

    # Now check Twitter
    begin
      twitter= Twitter::Base.new(twitter_user, twitter_pass)
      result = twitter.verify_credentials    
    rescue Exception => e
      result = nil
    end
    if result.nil?
      errors.add("Twitter credentials seem invalid?")      
    end
    
    # Now check broadsoft
    
  end
end