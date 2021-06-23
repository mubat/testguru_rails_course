class Test < ApplicationRecord
  LEVEL_LOW = (0..1).freeze
  LEVEL_MEDIUM = (2..4).freeze
  LEVEL_HARD = (5..Float::INFINITY).freeze

  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users
  belongs_to :created_by, class_name: 'User', foreign_key: :created_by_id

  scope :with_level, ->(level) { where(level: level) }
  scope :with_level_low, -> { with_level(LEVEL_LOW) }
  scope :with_level_medium, -> { with_level(LEVEL_MEDIUM) }
  scope :with_level_hard, -> { with_level(LEVEL_HARD) }

  scope :find_names_by_category, lambda { |category_name|
    joins(:category).where(category: { title: category_name }).order(id: :desc).pluck(:title) 
  }

  validates :title, :level, presence: true
end
