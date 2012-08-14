class  CategoryController < AuthenticationController

  def index
    	uri = URI.parse("http://leelah-system:3000/api/" + session[:user]["token"] + "/catalog/categories")
  		
  		resp = Net::HTTP.get(uri)

  		#require 'json'
  		render :json => resp
  		
      
  end
end
