require 'test_helper'
class CategoryTest < ActiveSupport::TestCase

  def setup 
    @category = Category.new(name: "Sport")
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "name should be presence" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    @category2 = Category.new(name: "Sport")
    assert_not @category2.valid?
  end

  test "name should be too long" do
    @category.name = "thisisalittletoolongthatsimorethan25characters"
    assert_not @category.valid?
  end

  test "name should be not too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end
end