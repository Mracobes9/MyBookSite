require 'test_helper'

class FavoriteBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get favorite_books_new_url
    assert_response :success
  end

end
