Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :articles, only: [:index]
      resources :companies, param: :hash_id, only: [:index, :show] do
        resources :articles, only: [:index], module: :companies
        resources :job_offers, only: [:index], module: :companies
        get :search, on: :collection
      end
      resources :interns, only: [:index]
    end
  end
end
