class Answer < ApplicationRecord
  belongs_to :question

  attribute :is_correct, default: false
end
