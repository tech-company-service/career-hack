Rails.application.routes.draw do
  # devise_scope :admins do
  #   root to: 'admins/registrations#new'
  #   get '/register', to: 'admins/registrations#new'
  #   post '/register', to: 'admins/registrations#create'
    
  #   get '/login', to: 'admins/sessions#new'
  #   post '/login', to: 'admins/sessions#create'
  #   delete '/logout', to: 'admins/sessions#destroy'
  # end
  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations', confirmations: 'admins/confirmations', unlocks: 'admins/unlocks' }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :api do
    namespace :v1 do
      resources :articles, only: [:index]
      resources :companies, param: :hash_id, only: [:index, :show] do
        resources :articles, only: [:index], module: :companies
        resources :job_offers, only: [:index], module: :companies
        get :search, on: :collection
      end
      resources :interns, only: [:index]
      post 'auth/:provider/callback', to: 'users#create'
    end
  end
end
