class CategoryController < AuthenticationController

  #
  #
  #
  def index
    begin
      render :json => LeelahWebServices.get_categories(session[:user]["token"])
    rescue
      # Gerer en cas d'erreur (message d'erreur dans attribut $!)
      print $!
    end
  end

  #
  #
  #
  def show
    begin
      @category = LeelahWebServices.get_category(session[:user]["token"], params[:id])
    rescue
      # Gerer en cas d'erreur (message d'erreur dans attribut $!)
      print $!
    end
  end

  #
  #
  #
  def create
    begin
      @category = LeelahWebServices.add_category(session[:user]["token"], params)
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
      @category = LeelahWebServices.update_category(session[:user]["token"], params[:id], params)
    rescue
      print $!
    end
  end

  #
  #
  #
  def destroy
    begin
      @result = LeelahWebServices.delete_category(session[:user]["token"], params[:id])
    rescue
      print NotImplementedError
    end
  end

end
