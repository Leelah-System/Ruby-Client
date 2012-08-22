class CatalogController < AuthenticationController

  def index
    begin
      @products = LeelahWebServices.get_products(session[:user]["token"])
    rescue
      # Gerer en cas d'erreur (message d'erreur dans attribut $!)
      print $!
    end
  end


end
