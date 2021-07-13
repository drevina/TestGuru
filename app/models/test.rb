class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  validates :title, presence: true,
                    uniqueness: { scope: :level }

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 },
                    uniqueness: { scope: :title }

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :sort_by_category, -> (category) { joins(:category).where('categories.title = :category', category: category) }


  def self.sort_tests_by_category(category)
    Test
        .sort_by_category(category)
        .order(title: :desc)
        .pluck(:title)
  end
end
