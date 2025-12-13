require "test_helper"

class Admin::QuizzesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_quizzes_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_quizzes_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_quizzes_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_quizzes_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_quizzes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_quizzes_destroy_url
    assert_response :success
  end
end
