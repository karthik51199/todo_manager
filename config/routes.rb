Rails.application.routes.draw do
  # get "todos", to: "todos#index"
  # put "todos", to: "todos#create"
  # get "todos/:id", to: "todos#show"
  get "/", to: "home#index"
  resources :todos
  resources :users
  post "users/login", to: "users#check"
end
