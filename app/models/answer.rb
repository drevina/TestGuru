class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true
  validate :answers_quantity, on: :create

  scope :correct, -> { where(correct: true)}

private

  def answers_quantity
    errors.add(:question, "Max quantity of answers is 4. You can't make more.") if question.answers.count > 4
  end
end
