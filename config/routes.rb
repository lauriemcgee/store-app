Rails.application.routes.draw do
 get "/" => "products#index"
 get "/products" => "products#index"
 get "/products/new" => "products#new"
 post "/products" => "products#create"
 get "/products/:id" => "products#show"
 get "/products/:id/edit" => "products#edit"
 patch "/products/:id" => "products#update"
 delete "/products/:id" => "products#destroy"

 get "/signup" => "users#new"
 post "/users" => "users#create"
 get "/login" => "sessions#new"
 post "/login" => "sessions#create"
 get "/logout" => "sessions#destroy"

 post "/orders" => "orders#create"
 get "/orders/:id" => "orders#show"

 get "/checkout" => "carted_products#index"
 post "/cart" => "carted_products#create"
 delete "/carted_products/:id" => "carted_products#destroy" 
end
