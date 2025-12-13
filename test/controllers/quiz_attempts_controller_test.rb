require "test_helper"

class QuizAttemptsControllerTest < ActionDispatch::IntegrationTest
  test "should get start" do
    get quiz_attempts_start_url
    assert_response :success
  end

  test "should get answer" do
    get quiz_attempts_answer_url
    assert_response :success
  end

  test "should get results" do
    get quiz_attempts_results_url
    assert_response :success
  end
end
