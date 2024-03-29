class Test < ApplicationRecord
  LEVEL_LOW = (0..1).freeze
  LEVEL_MEDIUM = (2..4).freeze
  LEVEL_HARD = (5..Float::INFINITY).freeze

  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :created_by, class_name: 'User', foreign_key: :created_by_id

  scope :with_level, ->(level) { where(level: level) }
  scope :with_level_low, -> { with_level(LEVEL_LOW) }
  scope :with_level_medium, -> { with_level(LEVEL_MEDIUM) }
  scope :with_level_hard, -> { with_level(LEVEL_HARD) }
  scope :with_questions, -> { left_outer_joins(:questions).where.not(questions: { id: nil }) }

  scope :names_by_category, lambda { |category_name|
    joins(:category).where(category: { title: category_name })
  }

  validates :title, :level, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :timer, numericality: { only_integer: true, greater_than: 0 }

  def find_names_by_category(category_name)
    Test.names_by_category(category_name).order(id: :desc).pluck(:title)
  end
end
