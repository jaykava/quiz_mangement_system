class AddTimePerQuestionToQuizzes < ActiveRecord::Migration[8.1]
  def change
    add_column :quizzes, :time_per_question, :integer, default: 10
  end
end
