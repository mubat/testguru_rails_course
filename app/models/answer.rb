class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(is_correct: true) }

  validates :body, :question, presence: true
  validate :validate_answers_count, on: :create

  private

  def validate_answers_count
    errors.add(:question, 'should has less than 5 answers') if question.answers.count > 4
  end
end
