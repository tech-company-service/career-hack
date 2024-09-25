Rails.application.routes.draw do
  root to: 'api/v1/companies#index'
  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations', confirmations: 'admins/confirmations', unlocks: 'admins/unlocks' }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :api do
    namespace :v1 do
      resources :articles, only: [:index]
      resources :companies, param: :hash_id, only: [:index, :show] do
        resources :articles, only: [:index], module: :companies
        resources :interns, only: [:index, :show], module: :companies
        resources :job_offers, only: [:index], module: :companies
        resources :benefits, only: [:index], module: :companies
        resources :services, only: [:index], module: :companies
        get :search, on: :collection
      end
      resources :interns, only: [:index]

      # for user
      resources :users, param: :uid, only: [:show, :update]
      post 'auth/:provider/callback', to: 'users#create'
    end
  end
end
