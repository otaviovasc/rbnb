Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :accommodations, only: %i[index new create show] do
    get "my_accommodations", on: :collection
    resources :rentals, only: %i[new create]
  end

  resources :rentals, only: %i[destroy] do
    get 'bookings', on: :collection
  end
end
