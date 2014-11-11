require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web, at: "/sidekiq"

  resources :triggers do
  end
  get '/triggers/:trigger_id/inc' => 'triggers#increase_durations', as: 'trig_inc'
  get '/triggers/:trigger_id/dec' => 'triggers#decrease_durations', as: 'trig_dec'
  resources :sessions
  get '/logout' => 'sessions#destroy', as: 'logout'

  resources :users, except: [:index] do
    resources :supporters
  end

  resources :welcome
  root to: 'welcome#index'
  resources :tokens, only: :index
  get "/auth/google_oauth2/callback" => 'tokens#create_gmail_token', as: "gmail_auth"
  get "/auth/twitter/callback" => 'tokens#create_twitter_token', as: "twitter_auth"

  get "/reports" => "daily_reports#weekly_report"


end
