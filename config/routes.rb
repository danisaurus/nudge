Rails.application.routes.draw do
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
