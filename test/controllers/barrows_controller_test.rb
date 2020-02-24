require 'test_helper'

class BarrowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barrow = barrows(:one)
  end

  test "should get index" do
    get barrows_url
    assert_response :success
  end

  test "should get new" do
    get new_barrow_url
    assert_response :success
  end

  test "should create barrow" do
    assert_difference('Barrow.count') do
      post barrows_url, params: { barrow: { category: @barrow.category, description: @barrow.description, name: @barrow.name, price: @barrow.price, town: @barrow.town, user_id: @barrow.user_id } }
    end

    assert_redirected_to barrow_url(Barrow.last)
  end

  test "should show barrow" do
    get barrow_url(@barrow)
    assert_response :success
  end

  test "should get edit" do
    get edit_barrow_url(@barrow)
    assert_response :success
  end

  test "should update barrow" do
    patch barrow_url(@barrow), params: { barrow: { category: @barrow.category, description: @barrow.description, name: @barrow.name, price: @barrow.price, town: @barrow.town, user_id: @barrow.user_id } }
    assert_redirected_to barrow_url(@barrow)
  end

  test "should destroy barrow" do
    assert_difference('Barrow.count', -1) do
      delete barrow_url(@barrow)
    end

    assert_redirected_to barrows_url
  end
end
