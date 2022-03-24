Rails.application.routes.draw do
  devise_for :users
  resources :listings
  
  root to: 'pages#home'
  get '/listings', to: 'listings#index'
  get '/listings/:id', to: 'listings#show'
  get '/listings/new', to: 'listings#new'
  post '/listings', to: 'listings#create'
  get '/listings/:id/edit', to: 'listings#edit'
  put '/listings/:id', to: 'listings#update'
  delete 'listings/:id', to:'listings#destroy'
end
