class CatalogController < AuthenticationController

  def index
    	uri = URI.parse("http://leelah-system.com:3000/api/" + session[:user]["token"] + "/catalog/products")
  		
  		resp = Net::HTTP.get(uri)

  		require 'json'
  		result = JSON.parse(resp)
  		@result = result
  		if result["success"]
        @products = result["result"]["products"]
      end
  end

end
