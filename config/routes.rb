require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web, at: "/sidekiq"

  resources :triggers do
  end

  resources :sessions
  get '/logout' => 'sessions#destroy', as: 'logout'

  resources :users, except: [:index] do
    resources :supporters
  end

  root to: 'sessions#new'
  resources :tokens, only: :index
  get "/auth/:provider/callback" => 'tokens#create'

end
