LeelahClient::Application.routes.draw do
  match "connect" => 'session#login'
  get "disconnect" => 'session#logout'

  get "catalog/index"

  get "categories" => 'category#list'
  post "category" => 'category#create'
  put "category" => 'category#update'
  delete "category" => 'category#delete'

  get "products" => 'product#list'
  post "product" => 'product#create'
  put "product" => 'product#update'
  delete "product" => 'product#delete'

  root :to => 'catalog#index'
end
