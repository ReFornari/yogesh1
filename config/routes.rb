Rails.application.routes.draw do
  get 'orderitems/index'
  get 'orderitems/show'
  get 'orderitems/new'
  get 'orderitems/edit'

  resources :orders do 
    resources:orderitems
  end
  
  devise_for :users do 
    resources:orders
  end
  
  get '/checkout' => 'cart#createOrder'

  post '/search' => 'items#search'

  #root to: "home#index"

  get 'cart/index'

  resources :items
  root 'static_pages#home'

  get '/gallery'=> 'static_pages#gallery'
  
  get '/aboutSend/:id' => 'static_pages#aboutSend'
  
  get '/categories'=> 'static_pages#categories'

  get '/about'=> 'static_pages#about'
  
  get '/login' => 'user#login' 

  get '/logout' => 'user#logout'

  get '/cart/clear', to: 'cart#clearCart'
  
  get '/cart/:id' => 'cart#add'
  
  get '/cart/remove/:id' => 'cart#remove'
  
  get '/paid/:id' => 'static_pages#paid'

  get '/cart/decrease/:id' => 'cart#decrease'
  

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
