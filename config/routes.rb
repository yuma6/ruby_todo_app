Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "task/index" => "task#index"
  get "task/:id/show" => "task#show"
end
