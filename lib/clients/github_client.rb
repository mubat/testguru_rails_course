class GithubClient
  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = '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'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.create_gist(params)
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end
