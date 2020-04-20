Rails.application.routes.draw do
  # get "todos", to: "todos#index"
  # put "todos", to: "todos#create"
  # get "todos/:id", to: "todos#show"
  get "/", to: "home#index"
  resources :todos
  resources :users
  get "/signin/new", to: "sessions#new", as: :new_session
  post "/signin", to: "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
