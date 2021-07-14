module QuestionsHelper

  def question_header(question)
    "#{question.new_record? ? 'Create new' : 'Edit'} #{question.test.title} question"
  end

end
