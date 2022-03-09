require "application_system_test_case"

class OMDBMoviesTest < ApplicationSystemTestCase
  test "can visit search" do
    visit omdb_movies_url
    assert_selector "h1", text: "Search for a movie to add"
  end

  test "should add movie" do
    visit movies_url
    click_on "Add movie"
    fill_in "query", with: "123" # TODO: Better place to set "123"?
    click_on "Search"
    click_on "Add" # TODO: Problem here, page not loaded yet? Visit site directly with params?
    assert_text "Movie was successfully created"
  end
end
