Rails.application.routes.draw do
  resources :movies
  resources :omdb_movies

  post "omdb_import", to: "omdb_import#create", as: :omdb_import
  root "movies#index"
end
