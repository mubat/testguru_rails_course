class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, inverse_of: :question

  validates :body, presence: true
end
