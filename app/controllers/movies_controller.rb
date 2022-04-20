class MoviesController < ApplicationController
  before_action :fetch

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def search
    respond_to do |format|
      format.turbo_stream do
        @results = @client.search(params[:title_search])
        render turbo_stream: turbo_stream.update("search_results", partial: "movies/search_results", locals: {client: @client})
      end
    end
  end

  def new
    @movie = Movie.new
    @return_path = new_movie_path
    if params[:omdb_id]
      @movie_details = @client.find_by_id(params[:omdb_id])
      @movie.url = @movie_details.poster
      @movie.title = @movie_details.title
      @movie.year = @movie_details.year
      @movie.genre = @movie_details.genre
      @movie.director = @movie_details.director
    end
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @movie = Movie.find(params[:id])
    @return_path = edit_movie_path(@movie)
    if params[:omdb_id]
      @movie_details = @client.find_by_id(params[:omdb_id])
      @movie.url = @movie_details.poster
      @movie.title = @movie_details.title
      @movie.year = @movie_details.year
      @movie.genre = @movie_details.genre
      @movie.director = @movie_details.director
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to movies_path, status: :see_other
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :year, :genre, :director, :url)
  end

  def fetch
    @client = Omdb::Api::Client.new(api_key: "28e67bb")
  end
end
