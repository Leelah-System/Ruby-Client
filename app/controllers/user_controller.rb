class UserController < AuthenticationController

  #
  #
  #
  def index
    begin
      @user = LeelahWebServices.get_user(session[:user]["token"], session[:user]["id"])
    rescue
      print $!
    end
  end

  #
  #
  #
  def show
    begin
      @users = LeelahWebServices.get_users(session[:user]["token"])
    rescue
      print $!
    end
  end

  #
  #
  #
  def create
    begin
      if params[:user]
        infos = params[:user]
        @user = LeelahWebServices.add_user(session[:user]["token"], infos)
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
      if params[:user]
        infos = params[:user]
        @user = LeelahWebServices.update_user(session[:user]["token"], params[:id], infos)
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
      @result = LeelahWebServices.delete_user(session[:user]["token"], params[:id])
    rescue
      print $!
    end
  end

end