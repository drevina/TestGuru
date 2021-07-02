class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: "Test"

  validates :email, presence: true
  validates :name, presence: true
  
  #scope-method instead of model-method -->
  scope :user_tests_by_level, -> (level) { where(level: level).joins(:tests_user).where(tests_users: {user_id: id}) }

end
