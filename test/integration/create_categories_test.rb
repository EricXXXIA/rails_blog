require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
  end

  test "get new category from and create category" do
    sign_in_as(@user, "password")
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post categories_path, params:{category:{name: "Sports"}}
      follow_redirect!
    end
    assert_template 'categories/index'
    assert_match "Sports", response.body
  end
end
