Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "tasks#index"

  get "tasks/index" => "tasks#index"
  get "tasks/:id/show" => "tasks#show"
  get "tasks/:id/edit" => "tasks#edit"

  post "tasks/create" => "tasks#create"
  post "tasks/:id/update" => "tasks#update"
  post "tasks/:id/destroy" => "tasks#destroy"
end
