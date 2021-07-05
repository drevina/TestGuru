class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: "Test"

  validates :email, presence: true
  validates :name, presence: true
  
  #scope-method instead of model-method -->
  scope :sort_by_level, -> (level) { where(level: level)

  def user_tests_by_level(level)
    tests.sort_by_level(level)
  end
end
