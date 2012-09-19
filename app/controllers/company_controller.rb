class CompanyController < AuthenticationController

  #
  #
  #
  def index
    begin
      render :json => LeelahWebServices.get_company(session[:user]["token"])
    rescue
      print $!
    end
  end

  #
  #
  #
  def update
    begin
      if params[:company]
        infos = params[:company]
        @company = LeelahWebServices.update_company(session[:user]["token"], params[:id], infos)
      end
    rescue
      print $!
    end
  end

  #
  #
  #
  def create_address
    begin
      if params[:address]
        # TODO
      end
    rescue
      print $!
    end
  end

  #
  #
  #
  def update_address
    begin
      if params[:address]
        # TODO
      end
    rescue
      print $!
    end
  end

  #
  #
  #
  def destroy_address
    begin
      if params[:address]
        # TODO
      end
    rescue
      print $!
    end
  end

end