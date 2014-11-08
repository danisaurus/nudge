Rails.application.routes.draw do
  resources :triggers do
  end

  resources :users, except: [:index] do
    resources :supporters
  end
  root to: 'users#new'
  resources :sessions, only: :index
  get "/auth/:provider/callback" => 'sessions#create'

end
