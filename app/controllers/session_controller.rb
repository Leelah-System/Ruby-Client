class SessionController < ApplicationController
  def login
    l = params[:login] || ""
    pwd = params[:password] || ""

    if !l.empty? && !pwd.empty?
      begin

        require 'net/http'
        uri = URI.parse(Rails.application.config.server_url + "/api/authenticate")
        args = {
            'login' => l,
            'password' => pwd
        }

        resp = Net::HTTP.post_form(uri, args)

        require 'json'
        result = JSON.parse(resp.body)

        if result["success"]
          session[:user] = result["result"]
          redirect_to root_path
        else
          flash[:error] = result["msg"]
          render :layout => 'auth.html.erb'
        end

      rescue

      end

    else
      render :layout => 'auth.html.erb'
    end
  end

  def authenticate

  end

  def logout
    session[:user] = nil
    redirect_to root_path
  end

end
