FirstSteps::Application.routes.draw do
  resources :posts

  root :to => "home#index"
  
  get "home/index"
  
  match "account/login" => "session#login"
  match "account/logout" => "session#logout"
  
  get "catalog" => "catalog#index"
  get "invoices" => "invoices#index"
  get "settings" => "settings#index"
  get "reports" => "reports#index"
  get "category" => "category#index"  
  get "product" => "product#index"
  
  get "product/update"
end

