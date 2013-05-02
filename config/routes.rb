RgatlTodoList::Application.routes.draw do

  resources :lists
  resources :tasks

  # sets which route is the default location for application
  root to: "lists#index"
end
