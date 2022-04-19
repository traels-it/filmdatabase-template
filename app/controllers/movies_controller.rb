class MoviesController < ApplicationController
<<<<<<< Updated upstream
=======
  before_action :fetch

>>>>>>> Stashed changes
  def index
    @movies = Movie.all
  end
  
  def show
    @movie = Movie.find(params[:id])
  end
<<<<<<< Updated upstream
  
=======

  def search
    respond_to do |format|
      format.turbo_stream do
        @results = @client.search(params[:title_search])
        render turbo_stream: turbo_stream.update("search_results", partial: "movies/search_results", locals: {client: @client})
      end
    end
  end

>>>>>>> Stashed changes
  def new
    @movie = Movie.new
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
<<<<<<< Updated upstream
    def movie_params
      params.require(:movie).permit(:title, :year, :genre, :director, :url)
    end
=======

  def movie_params
    params.require(:movie).permit(:title, :year, :genre, :director, :url)
  end

  def fetch
    @client = Omdb::Api::Client.new(api_key: "28e67bb")
  end
>>>>>>> Stashed changes
end
