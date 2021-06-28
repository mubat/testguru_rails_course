class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, inverse_of: :question

  validates :body, presence: true

  def to_s
    "ID #{id}, заговок '#{body}', создан #{created_at}, обновлён #{updated_at}."
  end
end
