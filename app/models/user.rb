# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :authored_tests, class_name: 'Test', foreign_key: :created_by_id

  scope :find_tests_by_level, ->(level) { tests.where(level: level) }

  validates :login, :email, presence: true
end
