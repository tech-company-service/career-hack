Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :articles, only: [:index]
      resources :companies, only: [:index, :show] do
        get :search, on: :collection
      end
      resources :interns, only: [:index]
    end
  end
end
