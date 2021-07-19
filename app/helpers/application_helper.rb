module ApplicationHelper
  def current_year
    Date.today.year.to_s
  end

  def github_url(author, repo)
    link_to 'Project on Github.com', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def alert_category(level)
    case level
    when 'notice'
      'alert-info'
    when 'error'
      'alert-danger'
    else
      'alert-secondary'
    end
  end
end
