module MoviesHelper
  BASE_URL = "http://www.omdbapi.com/"

  def get_omdb_json(imdb_id)
    HTTParty.get("#{BASE_URL}?apikey=#{Rails.application.credentials.omdb_api_key}&i=#{imdb_id}")
  end
end
