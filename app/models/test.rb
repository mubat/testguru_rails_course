class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users
  belongs_to :created_by, class_name: 'User', foreign_key: :created_by_id

  def self.find_by_category(category_name)
    joins(:category).where(category: { title: category_name }).order(id: :desc).pluck(:title)
  end
end
