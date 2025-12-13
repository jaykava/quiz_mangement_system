class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions, -> { order(position: :asc) }, dependent: :destroy
  has_many :quiz_attempts, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true

  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }

  def total_points
    questions.sum(:points)
  end
end
