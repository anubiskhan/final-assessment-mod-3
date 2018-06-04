Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
        post '/plays', to: 'games/plays#create'
      end
    end
  end

  root "welcome#index"
  get '/validations', to: 'validations#show'
  resources :welcome, only: [:new]
end
