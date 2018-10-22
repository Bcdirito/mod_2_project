Rails.application.routes.draw do
  resources :musicians
  resources :users
  resources :reviews
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
