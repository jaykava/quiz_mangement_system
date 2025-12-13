class Question < ApplicationRecord
  belongs_to :quiz
  has_many :options, dependent: :destroy
  has_many :attempt_answers, dependent: :destroy

  validates :content, presence: true
  validates :question_type, presence: true, inclusion: { in: %w[multiple_choice true_false matching] }
  validates :points, presence: true, numericality: { greater_than: 0 }
  validates :position, presence: true, numericality: { greater_than: 0 }

  accepts_nested_attributes_for :options, allow_destroy: true, reject_if: :all_blank

  def correct_options
    options.where(correct: true)
  end
end
