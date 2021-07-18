module QuestionsHelper
  def question_header(question)
    question.new_record? ? t('questions.new.title') : t('questions.edit.title', name: question.body)
  end
end
