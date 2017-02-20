Rails.application.routes.draw do
  root "sessions#new"

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :users, only: [:new, :create, :show] do
    resources :favorite_gifs, only: [:create, :destroy, :index]
  end

  resources :categories do
    resources :gifs
  end

  resources :gifs, only: [:index, :new, :create]

end
