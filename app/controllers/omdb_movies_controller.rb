class OmdbMoviesController < ApplicationController
  def index
    @result = params[:query].nil? ? nil : search_for_movies(params[:query])
  end

  private

  BASE_URL = "http://www.omdbapi.com/"

  def search_for_movies(query)
    query.nil? ? nil : HTTParty.get("#{BASE_URL}?apikey=#{ENV["OMDB_API_KEY"]}&s=#{query}")
  end
end
