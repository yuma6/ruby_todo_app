Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "tasks#index"

  get "tasks/index" => "tasks#index"
  get "tasks/:id/show" => "tasks#show"
  get "tasks/:id/edit" => "tasks#edit"
  get "users/sign_in" => "users#sign_in"
  get "users/sign_up" => "users#sign_up"
  get "teams/list" => "teams#index"
  get "teams/:id/space" => "teams#team_space"
  get "teams/:id/manager" => "teams#team_manager"

  post "tasks/create" => "tasks#create"
  post "tasks/:id/destroy" => "tasks#destroy"
  post "tasks/:id/edit" => "tasks#update"
  post "teams/create" => "teams#create"
  post "teams/:id/destroy" => "teams#destroy"
  post "teams/:id/team_in" => "teams#team_in"
  post "teams/:id/team_out" => "teams#team_out"
  post "teams/:id/remove" => "teams#team_remove"
  post "teams/:id/assignment" => "teams#team_assignment"

  delete "users/sign_out" => "users#sign_out"
end
