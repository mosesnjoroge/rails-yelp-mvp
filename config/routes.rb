Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ('/')
  # root 'articles#index'
  # resources :restaurants
  # show all restaurants
  get 'restaurants', to: 'restaurants#index'
  # new restaurant
  get 'restaurants/new', to: 'restaurants#new'
  post 'restaurants', to: 'restaurants#create'
  # individual restuarants
  get 'restaurants/:id', to: 'restaurants#show', as: :restaurant

  # resources :restaurants do
  #   resources :reviews, only: [:index, :new, :create]
  # end

  # resources :reviews, only: [:show, :edit, :update, :destroy]
end
