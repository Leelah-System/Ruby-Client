class ProductController < AuthenticationController

  #
  #
  #
  def index
    begin
      render :json => LeelahWebServices.get_products(session[:user]["token"])
    rescue
      print $!
    end
  end

  #
  #
  #
  def show
    begin
      @product = LeelahWebServices.get_product(session[:user]["token"], params[:id])
    rescue
      print $!
    end
  end

  #
  #
  #
  def create
    begin
      if params[:product]
        infos = params[:product]
        @product = LeelahWebServices.add_product(session[:user]["token"], infos)
      end
    rescue
      print $!
    end
  end

  #
  #
  #
  def update
    begin
      if params[:product]
        infos = params[:product]
        @product = LeelahWebServices.update_product(session[:user]["token"], params[:id], infos)
      end
    rescue
      print $!
    end
  end

  #
  #
  #
  def destroy
    begin
      @result = LeelahWebServices.delete_product(session[:user]["token"], params[:id])
    rescue
      print $!
    end
  end

end