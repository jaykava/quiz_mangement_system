class QuizAttemptsController < ApplicationController
  before_action :set_attempt

  def question
    @current_question_index = params[:question_index].to_i || 0
    @questions = shuffled_questions_for_attempt
    @question = @questions[@current_question_index]

    if @question.nil?
      redirect_to results_quiz_attempt_path(@attempt)
    end
  end

  def answer
    @question = Question.find(params[:question_id])
    @current_question_index = params[:current_index].to_i
    @questions = shuffled_questions_for_attempt

    # Validate that an answer was provided
    answer_provided = false

    # Handle different question types
    case @question.question_type
    when "multiple_choice"
      option_ids = params[:option_ids].is_a?(Array) ? params[:option_ids] : [ params[:option_id] ]
      option_ids = option_ids.compact.reject(&:blank?)

      if option_ids.empty?
        flash.now[:alert] = "Please select at least one answer before proceeding."
        render :question, status: :unprocessable_entity
        return
      end

      option_ids.each do |option_id|
        @attempt.attempt_answers.create!(
          question: @question,
          option_id: option_id
        )
      end
      answer_provided = true

    when "true_false"
      if params[:option_id].blank?
        flash.now[:alert] = "Please select an answer before proceeding."
        render :question, status: :unprocessable_entity
        return
      end

      @attempt.attempt_answers.create!(
        question: @question,
        option_id: params[:option_id]
      )
      answer_provided = true

    when "matching"
      if params[:matches].blank?
        flash.now[:alert] = "Please complete all matches before proceeding."
        render :question, status: :unprocessable_entity
        return
      end

      # Convert matches hash to array of properly formatted hashes
      matches_array = params[:matches].values.map do |match|
        {
          "option_id" => match[:option_id].to_i,
          "match_key" => match[:match_key]
        }
      end

      @attempt.attempt_answers.create!(
        question: @question,
        answer_text: matches_array.to_json
      )
      answer_provided = true
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

  # Get questions in shuffled order for current attempt
  def shuffled_questions_for_attempt
    question_ids = session["attempt_#{@attempt.id}_question_order"]

    if question_ids.present?
      # Fetch questions and sort them by the shuffled order
      questions = @attempt.quiz.questions.includes(:options).index_by(&:id)
      question_ids.map { |id| questions[id] }.compact
    else
      # Fallback: if no shuffled order exists, create one (for existing attempts)
      shuffled_ids = @attempt.quiz.questions.pluck(:id).shuffle
      session["attempt_#{@attempt.id}_question_order"] = shuffled_ids
      questions = @attempt.quiz.questions.includes(:options).index_by(&:id)
      shuffled_ids.map { |id| questions[id] }.compact
    end
  end
end
