module QuestionsHelper
  def question_header(question)
    question.present? ? "Изменение данных в вопросе #{question.body}" : 'Добавление нового вопроса'
  end
end
