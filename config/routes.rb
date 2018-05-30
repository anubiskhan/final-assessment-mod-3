Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :games
    end
  end

  root "welcome#index"
  resources :validations, only: [:show, :new]
  resources :welcome, only: [:new]
end
