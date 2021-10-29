Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "tasks#index"

  get "tasks/index" => "tasks#index"
  get "tasks/:id/show" => "tasks#show"
  get "tasks/:id/edit" => "tasks#edit"
  get "users/sign_in" => "users#sign_in"
  get "users/sign_up" => "users#sign_up"
  get "teams/list" => "teams#team_list"
  get "teams/:id/space" => "teams#team_space"

  post "tasks/create" => "tasks#create"
  post "tasks/:id/destroy" => "tasks#destroy"
  post "tasks/:id/edit" => "tasks#update"
  post "teams/create" => "teams#team_create"
  post "teams/:id/destroy" => "teams#team_destroy"
  post "teams/:id/team_in" => "teams#team_in"
  post "teams/:id/team_out" => "teams#team_out"

  delete "users/sign_out" => "users#sign_out"
end
