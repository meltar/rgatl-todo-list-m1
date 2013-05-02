RgatlTodoList::Application.routes.draw do

  resources :lists

  # sets which route is the default location for application
  root to: "lists#index"
end
