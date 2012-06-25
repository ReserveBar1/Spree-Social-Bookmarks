module Spree
  module SocialBookmarksHelper
    # Dislay the social bookmarks
    # <%= display_bookmarks(@product.name, product_url(@product)) %> OR
    # <%= display_bookmarks(@product.name) %> which will use the current URI request
  
    def display_bookmarks(title = "", url = nil, image_url = nil)
      if (url == nil)
        url = request.env["REQUEST_URI"]
        url = 'http://'+request.env["HTTP_HOST"] + request.fullpath if url.nil? or url.eql?(url.gsub(/http:/,'').gsub(/HTTP:/,''))
      elsif url.eql?(url.gsub(/http:/,'').gsub(/HTTP:/,''))
        url = 'http://'+request.env["HTTP_HOST"]+url
      end

      render :partial => 'shared/bookmarks', :locals => { :title => title, :url => escape(url), :image_url => escape(absolute_image_url(image_url)) }
    end
    
    
    private

     def escape(string)
       URI.escape string, /[^#{URI::PATTERN::UNRESERVED}]/
     end

     def absolute_image_url(url)
       return url if url.starts_with? "http"

       request.protocol + request.host + url
     end
    
  end
end