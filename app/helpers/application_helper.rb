module ApplicationHelper
  def current_year
    Date.today.year.to_s
  end

  def github_url(author, repo)
    link_to 'Project on Github.com', "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end
