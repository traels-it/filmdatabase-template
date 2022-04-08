Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "movies#index"
  
  resources :movies

  # Defines the root path route ("/")
  # root "articles#index"
end
