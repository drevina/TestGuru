class User < ApplicationRecord
  
  devise :database_authenticatable,
         :registerable,
         :recoverable, 
         :rememberable,
         :trackable, 
         :validatable,
         :confirmable
  
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test"

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  
  scope :sort_by_level, -> (level) { where(level: level) }

  def user_tests_by_level(level)
    tests.sort_by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
