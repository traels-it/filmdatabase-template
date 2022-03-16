require "test_helper"

class OMDBImportControllerTest < ActionDispatch::IntegrationTest
  test "can add movie" do
    assert_difference("Movie.count") do
      VCR.use_cassette("post_imdb_id") do
        post omdb_import_path, params: {imdb_id: "tt0094432"}
      end

      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_select "p", "Movie was successfully created."
    end
  end
end
