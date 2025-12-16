class Admin::QuizzesController < ApplicationController
  before_action :require_login
  before_action :set_quiz, only: [ :show, :edit, :update, :destroy, :toggle_publish ]

  def index
    @quizzes = current_user.quizzes.order(created_at: :desc)
  end

  def show
    @questions = @quiz.questions.includes(:options)
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = current_user.quizzes.build(quiz_params)

    if @quiz.save
      redirect_to admin_quiz_path(@quiz), notice: "Quiz created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to admin_quiz_path(@quiz), notice: "Quiz updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quiz.destroy
    redirect_to admin_quizzes_path, notice: "Quiz deleted successfully!"
  end

  def toggle_publish
    @quiz.update(published: !@quiz.published)
    status = @quiz.published? ? "published" : "unpublished"
    redirect_to admin_quiz_path(@quiz), notice: "Quiz #{status} successfully!"
  end

  private

  def set_quiz
    @quiz = current_user.quizzes.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:title, :description, :published, :time_per_question)
  end
end
