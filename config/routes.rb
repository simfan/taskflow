Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :projects do
    resources :tasks, shallow: true
  end
end