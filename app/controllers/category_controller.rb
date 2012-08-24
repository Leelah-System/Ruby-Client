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
      if params[:description]
        infos[:description] = params[:description]
      end
      if params[:label]
        infos[:label] = params[:label]
      end
      if params[:name]
        infos[:name] = params[:name]
      end
      if params[:path]
        infos[:path] = params[:path]
      end
      @category = LeelahWebServices.add_category(session[:user]["token"], infos)
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
