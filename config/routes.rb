Rails.application.routes.draw do

  resources :user do
    resources :supporters
  end

end
