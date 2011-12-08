class HomeController < ApplicationController
  
  def index

  end
  
  def getfeeds
    
    @language = params[:language]
    
    if @language == "English"
      @rss = RSS::Parser.parse(open('http://www.arenaflowers.com/files/sitemaps/arenaflowers.com/google_base_feed.xml').read, false)
    end 
    if @language == "French"
      @rss = RSS::Parser.parse(open('http://www.arenafleurs.fr/files/sitemaps/arenafleurs.fr/google_base_feed.xml').read, false)
    end
    if @language == "German"  
      @rss = RSS::Parser.parse(open('http://www.arenablumen.de/files/sitemaps/arenablumen.de/google_base_feed.xml').read, false)
    end
      
   
    render :update do |page|
      page.replace_html 'feeds', :partial => 'home/feeds'
      page.replace_html 'tag', :partial => 'home/discard'
      
    end
  end

end
