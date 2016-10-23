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
  
  test "invalid category submission results in failure" do
    get new_category_path
    assert_template 'category/new'
    assert_no_difference 'Category.count' do 
      post category_path, category: {name:" "}
    end
    assert_template 'category/new'
    assert_select "h2.panel-title"
    assert_select "div.panel-body"
  end
end