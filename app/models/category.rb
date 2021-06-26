class Category < ApplicationRecord
  has_many :tests

  scope :sorting_by_title, -> { order(:title) }

  validates :title, presence: true
end
