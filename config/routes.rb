Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post 'auth/:provider/callback', to: 'api/v1/users#create'
end
