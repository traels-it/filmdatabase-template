Rails.application.routes.draw do
  resources :movies
  resources :omdb_movies
  resources :omdb_import

  root "movies#index"
end
