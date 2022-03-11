class OMDBImportController < ApplicationController
  def create
    movie_json = get_omdb_json(params["imdb_id"])

    movie = Movie.new(
      title: movie_json["Title"],
      release_date: movie_json["Released"],
      genre: movie_json["Genre"],
      director: movie_json["Director"],
      actors: movie_json["Actors"],
      plot: movie_json["Plot"],
      image_url: movie_json["Poster"]
    )

    respond_to do |format|
      if movie.save
        format.html { redirect_to root_path, notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  BASE_URL = "http://www.omdbapi.com/"

  def get_omdb_json(imdb_id)
    HTTParty.get("#{BASE_URL}?apikey=#{Rails.application.credentials.omdb_api_key}&i=#{imdb_id}")
  end
end
