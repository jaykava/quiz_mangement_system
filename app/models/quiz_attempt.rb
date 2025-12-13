class QuizAttempt < ApplicationRecord
  belongs_to :quiz
  has_many :attempt_answers, dependent: :destroy

  validates :session_id, presence: true

  def calculate_score
    correct_count = attempt_answers.where(correct: true).count
    self.score = attempt_answers.where(correct: true).sum { |aa| aa.question.points }
    self.total_questions = quiz.questions.count
    save
  end

  def percentage
    return 0 if total_questions.zero?
    ((score / quiz.total_points.to_f) * 100).round(2)
  end
end
