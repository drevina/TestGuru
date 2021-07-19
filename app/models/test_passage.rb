class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question

  PASSING_RESULT = 85.freeze

def accept!(answer_ids)
  self.correct_questions += 1 if correct_answer?(answer_ids)

  save!
end

def total_result
  ((self.correct_question.to_f / test.questions.count.to_f) * 100).to_i
end

def done?
  total_result >= PASSING_RESULT
end

def completed?
  current_question.nil?
end

private

  def before_validation_set_question
    if current_question.blank?
      self.current_question = test.questions.first
    else
      self.current_question = next_question
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
