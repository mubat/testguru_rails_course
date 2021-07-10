module QuestionsHelper
  def question_header(question)
    question.new_record? ? 'Добавление нового вопроса' : "Изменение данных в вопросе #{question.body}"
  end
end
