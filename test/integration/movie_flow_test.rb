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
      VCR.use_cassette("post_imdb_id") do
        post "/omdb_import",
          params: {
            movie: {
              imdb_id: "tt0094432"
            }
          }
      end

      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_select "p", "Movie was successfully created."
    end
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
