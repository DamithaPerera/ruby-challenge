Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Nested resources for verticals, categories, and courses
  resources :verticals do
    resources :categories do
      resources :courses
    end
  end

  # OAuth routes with Doorkeeper
  use_doorkeeper
   # Devise routes for User authentication
  devise_for :users
end