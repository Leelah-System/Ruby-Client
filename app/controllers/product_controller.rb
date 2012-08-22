class ProductController < AuthenticationController

  def index
    begin
      render :json => LeelahWebServices.get_products(session[:user]["token"])
    rescue
      print $!
    end
  end

  def update
    begin

    rescue
      print NotImplementedError
    end
  end

end