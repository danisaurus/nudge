Rails.application.routes.draw do
  resources :triggers do
  end

  resources :user do
    resources :supporters
  end

end
