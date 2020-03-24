Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:create, :update]
  resources :posts, only: [:create, :show, :index]
  resources :comments, only: :create

  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  post '/rails/active_storage/direct_uploads', to: 'direct_uploads#create'

end
