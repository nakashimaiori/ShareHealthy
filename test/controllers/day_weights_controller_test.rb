require 'test_helper'

class DayWeightsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get day_weights_show_url
    assert_response :success
  end

  test "should get new" do
    get day_weights_new_url
    assert_response :success
  end

  test "should get edit" do
    get day_weights_edit_url
    assert_response :success
  end

end
