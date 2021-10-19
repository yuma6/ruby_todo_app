Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "tasks#index"

  get "tasks/index" => "tasks#index"
  get "tasks/:id/show" => "tasks#show"
  get "tasks/:id/edit" => "tasks#edit"
  get "users/sign_in" => "users#sign_in"
  get "users/sign_up" => "users#sign_up"

  post "tasks/create" => "tasks#create"
  post "tasks/:id/destroy" => "tasks#destroy"
  post "tasks/:id/edit" => "tasks#update"

  delete "users/sign_out" => "users#sign_out"
end
