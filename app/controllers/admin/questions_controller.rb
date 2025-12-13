class Admin::QuestionsController < ApplicationController
  before_action :require_login
  before_action :set_quiz
  before_action :set_question, only: [ :edit, :update, :destroy ]

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

  def set_quiz
    @quiz = current_user.quizzes.find(params[:quiz_id])
  end

  def set_question
    @question = @quiz.questions.find(params[:id])
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
