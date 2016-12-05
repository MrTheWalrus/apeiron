require 'test_helper'

class SystemsControllerTest < ActionController::TestCase
  test "should get overview" do
    get :overview
    assert_response :success
  end

  test "should get power" do
    get :power
    assert_response :success
  end

  test "should get structural" do
    get :structural
    assert_response :success
  end

  test "should get information" do
    get :information
    assert_response :success
  end

  test "should get defensive" do
    get :defensive
    assert_response :success
  end

  test "should get offensive" do
    get :offensive
    assert_response :success
  end

  test "should get transit" do
    get :transit
    assert_response :success
  end

  test "should get environmental" do
    get :environmental
    assert_response :success
  end

end
