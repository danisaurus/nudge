Rails.application.routes.draw do

  resources :user do
    resources :supporters
  end
  root to: 'sessions#new'
  resources :sessions, only: :index
  get "/auth/:provider/callback" => 'sessions#create'

end
