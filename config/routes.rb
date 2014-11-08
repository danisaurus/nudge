Rails.application.routes.draw do
  resources :triggers do
  end

  resources :users, except: [:index] do
    resources :supporters
  end

end
