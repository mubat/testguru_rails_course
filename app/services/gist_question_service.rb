class GistQuestionService
  include ActionView::Helpers::TranslationHelper

  def initialize(question, user, client: nil)
    @question = question
    @user = user
    @test = @question.test
    @client = client || GithubClient.new
  end

  def call
    response = @client.create_gist(gist_params)
    save_gist response, @question
    response
  end

  private

  def gist_params
    {
      description: t('gist_question_service.description', title: @test.title),
      public: true,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def save_gist(response, question)
    Gist.create(question: question, url: response[:html_url], user: @user)
  end

end
