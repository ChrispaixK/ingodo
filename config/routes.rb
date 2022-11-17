Rails.application.routes.draw do

  #devise_for :users
  devise_for :users, sign_out_via: %i[get post]
  # Defines the root path route ("/")
  root "home#index"
  resources :categories do 
    resources :transfers
  end

end
