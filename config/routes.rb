Rails.application.routes.draw do

  #devise_for :users
  devise_for :users, sign_out_via: %i[get post]
  # Defines the root path route ("/")
  root "categories#index"
  get '/categories/new', to: 'categories#new'
  post 'categories/create', to: 'categories#create'
  get 'categories/:id/transfers', to: 'transfers#index'
  get 'categories/:id/transfers/new', to: 'transfers#new'
  post '/categories/:id/transfers/create', to: 'transfers#create'

end
