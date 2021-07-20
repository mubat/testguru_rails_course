class GistQuestionService
  include ActionView::Helpers::TranslationHelper

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GithubClient.new
    @last_response = nil
  end

  def call
    @client.create_gist(gist_params)
  end

  def response
    @client.last_response
  end

  def success?
    response.status == 201
  end

  def url
    response.data[:html_url]
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

end
