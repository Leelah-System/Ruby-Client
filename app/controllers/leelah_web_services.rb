require 'rest_client'

class LeelahWebServices < AuthenticationController

  ###
  ## CATEGORIES
  ###

  # Get all categories
  #
  # @param [Strings, #token]
  # @return [Object, #categories]
  def self.get_categories(token)
    response = RestClient.get Rails.application.config.server_url + '/api/' + token + '/catalog/categories'
    result = JSON.parse(response.to_str)
    if result["success"]
      @categories = result["result"]["categories"]
      return @categories
    else
      raise result["msg"]
    end
  end

  # Get one category
  #
  # @param [Strings, #token]
  # @param [Int, #id]
  # @return [Object, #category]
  def self.get_category(token, id)
    response = RestClient.get Rails.application.config.server_url + '/api/' + token + '/catalog/categories/' + id
    result = JSON.parse(response.to_str)
    if result["success"]
      @category = result["result"]
      return @category
    else
      raise result["msg"]
    end
  end

  # Create a new category
  #
  # @param [Strings, #token]
  # @param [Object, #params]
  # @return [Object, #category]
  def self.add_category(token, params)
    response = RestClient.post Rails.application.config.server_url + '/api/' + token + '/catalog/categories', {"category" => params}.to_json, :content_type => :json, :accept => :json
    result = JSON.parse(response.to_str)
    if result["success"]
      @category = result["result"]
      return @category
    else
      raise result["msg"]
    end
  end

  # Update a category
  #
  # @param [Strings, #token]
  # @param [Int, #id]
  # @param [Object, #params]
  # @return [Object, #category]
  def self.update_category(token, id, params)
    response = RestClient.put Rails.application.config.server_url + '/api/' + token + '/catalog/categories/' + id, {"category" => params}.to_json, :content_type => :json, :accept => :json
    result = JSON.parse(response.to_str)
    if result["success"]
      @category = result["result"]
      return @category
    else
      raise result["msg"]
    end
  end

  # Delete a category
  #
  # @param [String, #token]
  # @param [Int, #id]
  # @return [Bool]
  def self.delete_category(token, id)
    response = RestClient.delete Rails.application.config.server_url + '/api/' + token + '/catalog/categories/' + id
    result = JSON.parse(response.to_str)
    if result["success"]
      return true
    else
      raise result["msg"]
    end
  end

  ###
  ## PRODUCTS
  ###

  # Get all products
  #
  # @param [Strings, #token]
  # @return [Object, #products]
  # Todo Add scope      = [with_stock, without_stock, search_text => text, search_reference => text,
  # Todo                   search_label => text, search_name => text, search_description => text,
  # Todo                   price => min_price || max_price ]
  # Todo Add parameters = [ scope, text , min_price, max_price ]
  def self.get_products(token)
    response = RestClient.get Rails.application.config.server_url + '/api/' + token + '/catalog/products'
    result = JSON.parse(response.to_str)
    if result["success"]
      @products = result["result"]["products"]
      return @products
    else
      raise result["msg"]
    end
  end

  # Get one product
  #
  # @param [Strings, #token]
  # @param [Int, #id]
  # @return [Object]
  def self.get_product(token, id)
    response = RestClient.get Rails.application.config.server_url + '/api/' + token + '/catalog/products/' + id
    result = JSON.parse(response.to_str)
    if result["success"]
      @product = result["result"]
      return @product
    else
      raise result["msg"]
    end
  end

  #  Add a new product
  #
  # @param [Strings, #token]
  # @param [Object, #params]
  # @return [Object]
  def self.add_product(token, params)
    response = RestClient.post Rails.application.config.server_url + '/api/' + token + '/catalog/products', {"product" => params}.to_json, :content_type => :json, :accept => :json
    result =  JSON.parse(response.to_str)
    if result["success"]
      @product = result["result"]
      return @product
    else
      raise result["msg"]
    end
  end

  # Update a product
  #
  # @param [String, #token]
  # @param [Int, #id]
  # @param [Object, #params]
  # @return [Object, #product]
  def self.update_product(token, id, params)
    response = RestClient.put Rails.application.config.server_url + '/api/' + token + '/catalog/products/' + id, {"product" => params}.to_json, :content_type => :json, :accept => :json
    result =  JSON.parse(response.to_str)
    if result["success"]
      @product = result["result"]
      return @product
    else
      raise result["msg"]
    end
  end

  # Delete a product
  #
  # @param [String, #token]
  # @param [Int, #id]
  # @return [Bool]
  def self.delete_product(token, id)
    response = RestClient.delete Rails.application.config.server_url + '/api/' + token + '/catalog/products/' + id
    result =  JSON.parse(response.to_str)
    if result["success"]
      return true
    else
      raise result["msg"]
    end
  end

  ###
  ## Orders
  ###

  # Get all orders
  #
  # @param [String, #token]
  # @return [Object, #orders]
  # Todo Add scope  = with_status
  # Todo Add status = [0 => init, 1 => pending, 2 => done]
  def self.get_orders(token)
    response = RestClient.get Rails.application.config.server_url + '/api/' + token + '/orders'
    result =  JSON.parse(response.to_str)
    if result["success"]
      @orders = result["result"]['orders']
      return @orders
    else
      raise result["msg"]
    end
  end

  # Get one order
  #
  # @param [String, #token]
  # @param [Int, #id]
  # @@return [Object, #order]
  def self.get_order(token, id)
    response = RestClient.get Rails.application.config.server_url + '/api/' + token + '/orders/' + id
    result =  JSON.parse(response.to_str)
    if result["success"]
      @order = result["result"]
      return @order
    else
      raise result["msg"]
    end
  end

  # Add an order
  #
  # @param [String, #token]
  # @param [Object, #params]
  # @return [Object, #order]
  def self.add_order(token, params)
    response = RestClient.post Rails.application.config.server_url + '/api/' + token + '/orders', {"order" => params}.to_json, :content_type => :json, :accept => :json
    result =  JSON.parse(response.to_str)
    if result["success"]
      @order = result["result"]
      return @order
    else
      raise result["msg"]
    end
  end

  # Update an order
  #
  # @param [String, #token]
  # @param [Object, #params]
  # @return [Object, #order]
  def self.update_order(token, id, params)
    response = RestClient.put Rails.application.config.server_url + '/api/' + token + '/orders/' + id, {"order" => params}.to_json, :content_type => :json, :accept => :json
    result =  JSON.parse(response.to_str)
    if result["success"]
      @order = result["result"]
      return @order
    else
      raise result["msg"]
    end
  end

  # Delete an order
  #
  # @param [String, #token]
  # @param [Int, #id]
  # @return [Bool]
  def self.delete_order(token, id)
    response = RestClient.delete Rails.application.config.server_url + '/api/' + token + '/orders/' + id
    result =  JSON.parse(response.to_str)
    if result["success"]
      return true
    else
      raise result["msg"]
    end
  end

  ###
  ## COMPANY
  ###

  # Get company
  #
  # @param [String, #token]
  # @return [Object, #company]
  def self.get_company(token)
    response = RestClient.get Rails.application.config.server_url + '/api/' + token + '/company'
    result =  JSON.parse(response.to_str)
    if result["success"]
      @company = result["result"]
      return @company
    else
      raise result["msg"]
    end
  end

  # Add a company
  #
  # @param [String, #token]
  # @param [Object, #params]
  # @return [Object, #company]
  def self.add_company(token, params)
    response = RestClient.post Rails.application.config.server_url + '/api/' + token + '/company', { "company" => params }.to_json, :content_type => :json, :accept => :json
    result =  JSON.parse(response.to_str)
    if result["success"]
      @company = result["result"]
      return @company
    else
      raise result["msg"]
    end
  end

  # Update a company
  #
  # @param [String, #token]
  # @param [Int, #id]
  # @param [Object, #params]
  # @return [Object, #company]
  def self.update_company(token, id, params)
    response = RestClient.put Rails.application.config.server_url + '/api/' + token + '/company/' + id, { "company" => params }.to_json, :content_type => :json, :accept => :json
    result =  JSON.parse(response.to_str)
    if result["success"]
      @company = result["result"]
      return @company
    else
      raise result["msg"]
    end
  end

  # Delete a company
  #
  # @param [String, #token]
  # @param [Int, #id]
  # @return [Bool]
  def self.delete_company(token, id)
    response = RestClient.delete Rails.application.config.server_url + '/api/' + token + '/company/' + id
    result =  JSON.parse(response.to_str)
    if result["success"]
      return true
    else
      raise result["msg"]
    end
  end

  ###
  ## USERS
  ###

  # Get users
  #
  # @param [String, #token]
  # @return [Object, #users]
  def self.get_users(token)
    response = RestClient.get Rails.application.config.server_url + '/api/' + token + '/users'
    result =  JSON.parse(response.to_str)
    if result["success"]
      @users = result["result"]["users"]
      return @users
    else
      raise result["msg"]
    end
  end

  # Get user
  #
  # @param [String, #token]
  # @return [Object, #user]
  def self.get_user(token, id)
    response = RestClient.get Rails.application.config.server_url + '/api/' + token + '/users/' + id 
    result =  JSON.parse(response.to_str)
    if result["success"]
      @user = result["result"]
      return @user
    else
      raise result["msg"]
    end
  end
  
  # Add a new user
  #
  # @param [String, #token]
  # @param [Object, #params]
  # @return [Object, #user]
  def self.add_user(token, params)
    response = RestClient.post Rails.application.config.server_url + '/api' + token + '/users', {"user" => params}.to_json, :content_type => :json, :accept => :json
    result =  JSON.parse(response.to_str)
    if result["success"]
      @user = result["result"]
      return @user
    else
      raise result["msg"]
    end
  end

  # Update an user
  #
  # @param [String, #token]
  # @param [Object, #params]
  # @param [Int, #id]
  # @return [Object, #user]
  def self.update_user(token, id, params)
    response = RestClient.put Rails.application.config.server_url + '/api/' + token + '/users/' + id, {"user" => params}.to_json, :content_type => :json, :accept => :json
    result =  JSON.parse(response.to_str)
    if result["success"]
      @order = result["result"]
      return @order
    else
      raise result["msg"]
    end
  end

  # Delete an user
  #
  # @param [String, #token]
  # @param [Int, #id]
  # @return [Bool]
  def self.delete_user(token, id)
    response = RestClient.delete Rails.application.config.server_url + '/api/' + token + '/users/' + id
    result =  JSON.parse(response.to_str)
    if result["success"]
      return true
    else
      raise result["msg"]
    end
  end


end