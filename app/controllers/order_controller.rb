##
## Orders Management
##
class OrderController < AuthenticationController

  #
  #
  #
  def index
    begin
      @orders = LeelahWebServices.get_orders(session[:user]["token"])
        # render :json => LeelahWebServices.get_orders(session[:user]["token"])
    rescue
      print $!
    end
  end

  #
  #
  #
  def list
    begin
      render :json => LeelahWebServices.get_orders(session[:user]["token"])
    rescue
      print $!
    end
  end

  #
  #
  #
  def show
    begin
      @order = LeelahWebServices.get_order(session[:user]["token"], params[:id])
    rescue
      print $!
    end
  end

  #
  #
  #
  def create
    begin
      if params[:order]
        infos = params[:order]
        @order = LeelahWebServices.add_order(session[:user]["token"], infos)
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
      if params[:order]
        infos = params[:order]
        @order = LeelahWebServices.update_order(session[:user]["token"], params[:id], infos)
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
      @result = LeelahWebServices.delete_order(session[:user]["token"], params[:id])
    rescue
      print $!
    end
  end
end