Rails.application.routes.draw do
  get "/", to: "application#welcome"
  get "/signup", to: "application#signup"

  resources :musicians
  resources :listeners, only: [:new, :create, :update, :edit, :destroy, :show]
  resources :reviews
  get "/login", to: "sessions#login"
  get "/login_listener", to: "sessions#new_listener"
  post "/login_listener", to: "sessions#create_listener"
  get "/login_musician", to: "sessions#new_musician"
  post "/login_musician", to: "sessions#create_musician"
  delete "/logout", to: "sessions#destroy"

  get ':not_found' => 'musicians#index', :constraints => { :not_found => /.*/ }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
