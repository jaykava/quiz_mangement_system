class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.published.order(created_at: :desc)
  end

  def show
    @quiz = Quiz.published.find(params[:id])
  end

  def start_attempt
    @quiz = Quiz.published.find(params[:id])
    @attempt = @quiz.quiz_attempts.create!(
      session_id: current_quiz_session,
      score: 0,
      total_questions: @quiz.questions.count
    )

    redirect_to question_quiz_attempt_path(@attempt)
  end
end
