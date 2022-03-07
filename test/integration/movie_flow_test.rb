require "test_helper"

class MovieFlowTest < ActionDispatch::IntegrationTest
  setup do
    @testMovie = movies(:one)
  end

  test "can see movie list" do
    get "/"
    assert_select "h1", "Movies"
  end

  test "can add movie" do
    assert_difference("Movie.count") do
      post "/movies",
        params: {movie: {title: "Can Create",
                         release_date: "25 Jun 1982",
                         genre: "A Genre",
                         director: "A Director",
                         actors: "An Actor",
                         plot: "A Plot",
                         image_url: "A url"}}
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "Movie was successfully created."
  end

  test "can delete movie" do
    assert_difference("Movie.count", -1) do
      delete movie_url(movies.first)
    end
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "Movie was successfully removed."
  end
end
