Rails.application.routes.draw do
  devise_for :users

  resources :items
  resources :categories

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'users', controllers: {
        sessions: 'api/v1/users/sessions',
        passwords: 'api/v1/users/passwords'
      }

      resources :items
    end
  end

  root 'items#index'
end
