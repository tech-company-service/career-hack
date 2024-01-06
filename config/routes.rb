Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :articles, only: [:index]
      resources :companies, only: [:index, :show] do
        get :search, on: :collection
      end
      resources :interns, only: [:index]
      post 'auth/:provider/callback', to: 'users#create'
    end
  end
end
