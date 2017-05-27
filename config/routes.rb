Rails.application.routes.draw do
  get '/signup' => 'users#new'
  get '/dashboard' => 'users#index'
  
  post '/create' => 'sessions#create'
  post '/login' => 'sessions#login'
  delete '/logout' => 'sessions#logout'

  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
