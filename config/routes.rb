Rails.application.routes.draw do
  root "welcome#index"
  resources :validations, only: [:show, :new]
end
