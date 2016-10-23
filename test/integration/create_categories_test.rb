require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  test "category n create new"
  get new_category_path
  assert_template 'category/new'
  assert_difference 'Category.count', 1 do
    post_via_redirect category_path, category: {name:"Sports"}
  end
  assert_template 'category/index'
  assert_match 'Sports', response.body
  end
end