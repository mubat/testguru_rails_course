class Answer < ApplicationRecord
  belongs_to :question

  attribute :is_correct, default: false

  scope :correct, -> { where(is_correct: true) }
end
