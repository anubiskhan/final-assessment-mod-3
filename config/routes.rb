Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/games/:id', to: 'games#show'
      post '/games/:id/plays', to: 'plays#create'
    end
  end

  root "welcome#index"
  resources :validations, only: [:show, :new]
  resources :welcome, only: [:new]
end
