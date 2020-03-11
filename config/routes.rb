Rails.application.routes.draw do
  # get "todos", to: "todos#index"
  # put "todos", to: "todos#create"
  # get "todos/:id", to: "todos#show"
  resources :todos
end
