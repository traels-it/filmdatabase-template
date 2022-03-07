require "application_system_test_case"

class OmdbMoviesTest < ApplicationSystemTestCase
  test "can visit search" do
    visit omdb_movies_url
    assert_selector "h1", text: "Search for a movie to add"
  end
end
