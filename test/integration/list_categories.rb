require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name:"sport")
    @category2 =  Category.create(name:"sport")
  end
  
  test "should show category listing" do
    get categories_path
    assert_template "categories/index"
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end
  
end