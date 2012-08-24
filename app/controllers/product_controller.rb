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
      @product = LeelahWebServices.add_product(session[:user]["token"], params)
    rescue
      # Gerer en cas d'erreur (message d'erreur dans attribut $!)
      print $!
    end
  end

  #
  #
  #
  def update
    begin
      @product = LeelahWebServices.update_product(session[:user]["token"], params[:id], params)
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