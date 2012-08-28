module ApplicationHelper
  def getCurrentUserToken
    return session[:user]["token"]
  end
end
