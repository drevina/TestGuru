module QuestionsHelper

  def question_header(type)
    if type == "edit"
      return "Edit #{@test.title} question"
    else
      return "Create new #{@test.title} question"
    end
  end

end
