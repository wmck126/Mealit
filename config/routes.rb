Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post "/signup", to: "users#create"
  get "/me", to: "users#show"

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:index, :show] do
    resources :meals, only: [:index, :show]
  end
  resources :meals, only: [:index, :show] do
    resources :courses, only: [:index, :show]
  end

  resources :ingredients, only: [:index, :show]

  resources :courses, only: [:index, :show] do
    resources :meals, only: [:index, :show]
  end
end
