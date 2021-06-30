class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  def self.sort_tests_by_category(category)
    Test.joins('JOIN categories ON tests.category_id = categories.id').where('categories.title = ?', category).order('tests.title DESC').pluck('tests.title')
  end
end
