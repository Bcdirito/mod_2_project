Rails.application.routes.draw do
  resources :musicians
  resources :users
  resources :reviews
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
