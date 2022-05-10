require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "create a new category form and create category" do
    get "/categories/new"
    assert_response :success
    assert_difference "Category.count",1 do
      post categories_path, params: {category: {name: "Main Dish"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Main Dish", response.body
  end
end
