class OMDBImportController < ApplicationController
  def create
    # print("PARAMS: #{params["movie"]}")

    movie_json = get_omdb_json(params["movie"]["imdb_id"])

    movie = Movie.new
    movie.title = movie_json["Title"]
    movie.release_date = movie_json["Released"]
    movie.genre = movie_json["Genre"]
    movie.director = movie_json["Director"]
    movie.actors = movie_json["Actors"]
    movie.plot = movie_json["Plot"]
    movie.image_url = movie_json["Poster"]

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
    imdb_id.nil? ? nil : HTTParty.get("#{BASE_URL}?apikey=#{Rails.application.credentials.omdb_api_key}&i=#{imdb_id}")
  end
end
