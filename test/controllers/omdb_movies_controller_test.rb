require "test_helper"

class OMDBMoviesControllerTest < ActionDispatch::IntegrationTest
  test "can delete movie" do
    VCR.use_cassette("post_imdb_id") do
      assert_difference("Movie.count", -1) do
        delete movie_url(movies.first)
      end
    end
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "Movie was successfully removed."
  end
end
