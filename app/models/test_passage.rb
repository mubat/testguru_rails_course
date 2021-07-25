class TestPassage < ApplicationRecord
  PERCENT_TO_PASSED = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :bef_val_set_first_question, on: :create
  before_update :bef_update_set_next_question
  before_update :bef_update_set_passed_percent # set only if test completed

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def percent_of_correct
    correct_questions.to_f / test.questions.count * 100.0
  end

  def passed?
    percent_of_correct >= PERCENT_TO_PASSED
  end

  def current_position
    test.questions.where('id <= ?', current_question.id).count
  end

  private

  def bef_val_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def bef_update_set_next_question
    self.current_question = next_question # if correct_questions_was < self.correct_questions
  end

  def bef_update_set_passed_percent
    self.passed_percent = percent_of_correct if completed?
  end
end
