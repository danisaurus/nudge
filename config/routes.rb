Rails.application.routes.draw do

  resources :users, except: [:index] do
    resources :supporters
  end

end
