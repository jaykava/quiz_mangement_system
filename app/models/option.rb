class Option < ApplicationRecord
  belongs_to :question
  has_many :attempt_answers, dependent: :destroy

  validates :content, presence: true
end
