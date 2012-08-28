class AuthenticationController < ApplicationController
  before_filter :require_login

  protected

  def current_user
    @current_user ||= session[:user]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    unless logged_in?
      redirect_to connect_path
    end
  end
end
  