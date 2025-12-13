class User < ApplicationRecord
  has_secure_password

  has_many :quizzes, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: %w[admin] }

  before_validation :set_default_role, on: :create

  private

  def set_default_role
    self.role ||= "admin"
  end
end
