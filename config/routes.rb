LeelahClient::Application.routes.draw do
  # #
  match "connect" => 'session#login'
  get "disconnect" => 'session#logout'

  ##
  get "catalog/index"

  # CATEGORY #
  get "categories" => 'category#index'
  post "category" => 'category#create'
  put "category" => 'category#update'
  delete "category" => 'category#destroy'

  # PRODUCT #
  get "products" => 'product#index'
  post "product" => 'product#create'
  put "product" => 'product#update'
  delete "product" => 'product#destroy'

  ##
  get "order/index"

  # ORDER #
  get "orders" => 'order#list'
  post "order" => 'order#create'
  put "order" => 'order#update'
  delete "order" => 'order#destroy'

  ##
  get "user/index"

  # USERS #
  get "users" => 'user#show'
  post "user" => 'user#create'
  put "user" => 'user#update'
  delete "user" => 'user#destroy'

  ##
  get "setting/index"

  # SETTINGS #
  get "company" => 'company#index'
  put "company" => 'company#update'

  post "address" => 'company#create_address'
  put "address" => 'company#update_address'
  delete "address" => 'company#destroy_address'

  ##
  root :to => 'catalog#index'
end
