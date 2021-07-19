class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test"

  validates :email, presence: true
  validates :name, presence: true
  
  #scope-method instead of model-method -->
  scope :sort_by_level, -> (level) { where(level: level) }

  def user_tests_by_level(level)
    tests.sort_by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
