require "test_helper"

class MoviesControllerTest < ActionDispatch::IntegrationTest
  
  test "go to index and check movie list" do
    get "/"
    assert_select "tr", 2
  end

  test "should create a new movie" do
    get "/movies/new"
    assert_response :success

    post "/movies",
      params: { movie: {title: "Great success!", year: 1991, genre: "Test", director: "Quentin Corfitz", url: "http://www.notanurl.com/" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "a", "Great success!"
  end

  test "should update a movie" do
    get "/movies/1/edit"
    assert_response :success

    patch movie_url,
      params: { movie: {title: "Another great success!", year: 1991, genre: "Test", director: "Quentin Corfitz", url: "http://www.notanurl.com/" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "a", "Another great success!"
  end

  test "should delete movie" do
    get "/movies/1"
    assert_response :success

    delete movie_url
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "a", "Titanic", false
  end

end
