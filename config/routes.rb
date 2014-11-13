require 'sidekiq/web'

Rails.application.routes.draw do

  post '/moods' => 'users#moods'
  get '/triggers/:trigger_id/delete' => 'triggers#destroy'
  post '/triggers/:trigger_id' => 'triggers#update'
  resources :triggers do
  end
  get '/triggers/:trigger_id/inc' => 'triggers#increase_durations', as: 'trig_inc'
  get '/triggers/:trigger_id/dec' => 'triggers#decrease_durations', as: 'trig_dec'
  resources :sessions
  get '/logout' => 'sessions#destroy', as: 'logout'
  get '/users/get_started' => 'users#get_started', as: 'get_started'
  get '/users/:user_id/toggle_twitter_triggers' => 'users#toggle_twitter_triggers', as: 'toggle_twitter_trig'
  get '/users/:user_id/toggle_google_triggers' => 'users#toggle_google_triggers', as: 'toggle_google_trig'
  get '/users/:trigger_id/toggle' => 'users#specific_toggle', as: 'trig_toggle'
  get '/user/:user_id/supporters/:supporter_id/delete' => 'supporters#destroy', as: 'delete_supporter'
  resources :users, except: [:index] do
    resources :supporters
  end

  resources :welcome
  root to: 'welcome#index'
  resources :tokens, only: :index
  get "/auth/google_oauth2/callback" => 'tokens#create_gmail_token', as: "gmail_auth"
  get "/auth/twitter/callback" => 'tokens#create_twitter_token', as: "twitter_auth"

  get "/reports" => "daily_reports#weekly_report"

  get '*path', :controller => 'users', :action => 'show'

end
