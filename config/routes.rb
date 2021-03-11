# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'users', controllers: {
        registrations: 'api/v1/users/registrations',
        sessions: 'api/v1/users/sessions'
      }

      resources :items, except: %I[new edit] do
        resources :photos, except: %I[new edit]
      end
    end
  end

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    omniauth_callback: 'users/omniauth_callbacks',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }

  resources :items, only: %I[index show] do
    resources :photos, module: 'items'
  end
  resources :stores, except: :show do
    resources :items, module: 'stores'
  end
  resource :account, only: %I[show edit update]
  resource :profile
  resource :setting

  root 'items#index'
end
