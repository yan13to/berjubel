# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        sessions: 'api/v1/auth/sessions'
      }

      as :user do
        # Define routes for User within this block.
      end

      resources :items
    end
  end

  devise_for :users, path: 'auth'

  resources :items

  root 'items#index'
end
