# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :tests, foreign_key: :created_by_id

  def find_tests_by_level(level)
    tests.where(level: level)
  end
end
