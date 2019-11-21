Rails.application.routes.draw do
  devise_for :users

  resources :items
  resources :categories

  root 'items#index'
end
