##
## Orders Management
##
class SettingController < AuthenticationController

  #
  #
  #
  def index
    begin
      @company = LeelahWebServices.get_company(session[:user]["token"])
      @users = LeelahWebServices.get_users(session[:user]["token"])
    rescue
      print $!
    end
  end

end