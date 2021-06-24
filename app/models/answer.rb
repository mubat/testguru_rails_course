class Answer < ApplicationRecord
  belongs_to :question, inverse_of: :answers

  attribute :is_correct, default: false

  scope :correct, -> { where(is_correct: true) }

  validates :body, :question, presence: true
  validate :validate_answers_count, if: -> { question.present? }

  private

  def validate_answers_count
    errors.add(:question, 'should has answers') unless question.answers.exists?
    errors.add(:question, 'should has less than 5 answers') if question.answers.count > 4
  end
end
