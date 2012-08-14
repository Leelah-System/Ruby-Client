class  ProductController < AuthenticationController

  #before_filter :require_login, :except => :update

  def index
      base_url = "http://leelah-system.com:3000/api/" + session[:user]["token"]

      uri = URI.parse(base_url + "/catalog/products")
  		
  		resp = Net::HTTP.get(uri)

  		#require 'json'
  		render :json => resp
  		
      
  end
  
  def update
    base_url = "http://leelah-system.com:3000/api/" + session[:user]["token"]
    id = params[:id]
    uri = URI.parse(base_url + "/catalog/products/" + id)
    
    render :json => true
  end
  
end