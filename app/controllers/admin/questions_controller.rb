class Admin::QuestionsController < ApplicationController
  before_action :require_login
  before_action :set_question, only: [ :edit, :update, :destroy ]
  before_action :set_quiz

  def new
    @question = @quiz.questions.build
    4.times { @question.options.build }
  end

  def create
    @question = @quiz.questions.build(question_params)
    @question.position = @quiz.questions.maximum(:position).to_i + 1

    if @question.save
      redirect_to admin_quiz_path(@quiz), notice: "Question added successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to admin_quiz_path(@quiz), notice: "Question updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_quiz_path(@quiz), notice: "Question deleted successfully!"
  end

  private

  def set_question
    # For shallow routes (edit, update, destroy), find question first
    @question = Question.find(params[:id])
    # Ensure the question belongs to a quiz owned by current user
    unless @question.quiz.user_id == current_user.id
      redirect_to admin_root_path, alert: "Access denied"
    end
  end

  def set_quiz
    # For nested routes (new, create), get quiz from params
    # For shallow routes (edit, update, destroy), get quiz from question
    if params[:quiz_id]
      @quiz = current_user.quizzes.find(params[:quiz_id])
    elsif @question
      @quiz = @question.quiz
    end
  end

  def question_params
    params.require(:question).permit(
      :content,
      :question_type,
      :points,
      options_attributes: [ :id, :content, :correct, :match_key, :_destroy ]
    )
  end
end
