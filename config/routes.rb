Rails.application.routes.draw do
  resources :movies
  resources :omdb_movies

  root "movies#index"
end
