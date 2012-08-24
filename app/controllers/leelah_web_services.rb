require 'rest_client'

class LeelahWebServices < AuthenticationController
  # To change this template use File | Settings | File Templates.

  ##
  # Catalogue
  ##

  # Get all categories
  #
  # @param [Strings, #token]
  # @return [Object, #categories]
  def self.get_categories(token)
    response = RestClient.get 'http://leelah-system.com:3000/api/' + token + '/catalog/categories'
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
    response = RestClient.get 'http://leelah-system.com:3000/api/' + token + '/catalog/categories/' + id
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
    response = RestClient.post 'http://leelah-system.com:3000/api/' + token + '/catalog/categories', {"category" => params}.to_json, :content_type => :json, :accept => :json
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
    response = RestClient.put 'http://leelah-system.com:3000/api/' + token + '/catalog/categories/' + id, {"category" => params}.to_json, :content_type => :json, :accept => :json
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
  # @return [Boolean, true]
  def self.delete_category(token, id)
    response = RestClient.delete 'http://leelah-system.com:3000/api/' + token + '/catalog/categories/' + id
    result = JSON.parse(response.to_str)
    if result["success"]
      return true
    else
      raise result["msg"]
    end
  end

  # Get all products
  #
  # @param [Strings, #token]
  # @return [Object, #products]
  def self.get_products(token)
    response = RestClient.get 'http://leelah-system.com:3000/api/' + token + '/catalog/products'
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
    response = RestClient.get 'http://leelah-system.com:3000/api/' + token + '/catalog/products/' + id
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
    response = RestClient.post 'http://leelah-system.com:3000/api/' + token + '/catalog/products', {"product" => params}.to_json, :content_type => :json, :accept => :json
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
    response = RestClient.put 'http://leelah-system.com:3000/api/' + token + '/catalog/products/' + id, {"product" => params}.to_json, :content_type => :json, :accept => :json
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
  # @return [Boolean, true]
  def self.delete_product(token, id)
    response = RestClient.delete 'http://leelah-system.com:3000/api/' + token + '/catalog/products/' + id
    result =  JSON.parse(response.to_str)
    if result["success"]
      return true
    else
      raise result["msg"]
    end
  end
end