Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:create]
  resources :posts, only: [:create, :show]

  post '/login', to: 'auth#create'
  get '/profile', to: 'user#profile'

end
