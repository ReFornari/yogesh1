Rails.application.routes.draw do
  get 'cart/index'

  resources :items
  root 'static_pages#home'

  get '/gallery'=> 'static_pages#gallery'
  
  get '/categories'=> 'static_pages#categories'

  get '/about'=> 'static_pages#about'
  
  get '/login' => 'user#login' 

  get '/logout' => 'user#logout'
  
  get '/cart/clear', to: 'cart#clearCart'
  
  get '/cart/:id' => 'cart#add'
  
  get '/cart/remove/:id' => 'cart#remove'
  
  get '/cart/decrease/:id' => 'cart#decrease'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
