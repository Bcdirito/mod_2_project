Rails.application.routes.draw do
  get "/", to: "application#welcome"
  resources :musicians
  resources :users
  resources :reviews
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
