require "test_helper"

class Admin::QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_questions_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_questions_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_questions_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_questions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_questions_destroy_url
    assert_response :success
  end
end
