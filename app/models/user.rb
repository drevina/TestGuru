class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: "Test"

  def user_tests_by_level(level)
    Test.where(level: level).joins('JOIN tests_users ON tests_users.test_id = tests.id').where(tests_users: {user_id: id})
  end
end
