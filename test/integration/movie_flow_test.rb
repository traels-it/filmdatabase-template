require "test_helper"

class MovieFlowTest < ActionDispatch::IntegrationTest
  test "can see movie list" do
    get "/"
    assert_select "h1", "Movies"
  end
end
