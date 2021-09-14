Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "task#index"

  get "task/index" => "task#index"
  get "task/:id/show" => "task#show"
  get "task/:id/edit" => "task#edit"

  post "post/new" => "post#new"
  post "post/:id/edit" => "post#edit"
  post "post/:id/destroy" => "post#destroy"
end
