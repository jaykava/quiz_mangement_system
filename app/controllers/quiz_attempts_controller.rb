class QuizAttemptsController < ApplicationController
  before_action :set_attempt

  def question
    @current_question_index = params[:question_index].to_i || 0
    @questions = @attempt.quiz.questions.includes(:options)
    @question = @questions[@current_question_index]

    if @question.nil?
      redirect_to results_quiz_attempt_path(@attempt)
    end
  end

  def answer
    @question = Question.find(params[:question_id])

    # Handle different question types
    case @question.question_type
    when "multiple_choice"
      option_ids = params[:option_ids].is_a?(Array) ? params[:option_ids] : [ params[:option_id] ]
      option_ids.compact.each do |option_id|
        @attempt.attempt_answers.create!(
          question: @question,
          option_id: option_id
        )
      end
    when "true_false"
      @attempt.attempt_answers.create!(
        question: @question,
        option_id: params[:option_id]
      )
    when "matching"
      @attempt.attempt_answers.create!(
        question: @question,
        answer_text: params[:matches].to_json
      )
    end

    next_index = params[:current_index].to_i + 1

    if next_index >= @attempt.quiz.questions.count
      @attempt.calculate_score
      redirect_to results_quiz_attempt_path(@attempt)
    else
      redirect_to question_quiz_attempt_path(@attempt, question_index: next_index)
    end
  end

  def results
    @attempt.calculate_score unless @attempt.score
    @questions = @attempt.quiz.questions.includes(:options, :attempt_answers)
  end

  private

  def set_attempt
    @attempt = QuizAttempt.find(params[:id])
  end
end
