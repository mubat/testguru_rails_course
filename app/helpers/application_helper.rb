module ApplicationHelper
  ALERT_CATEGORIES = {
    notice: 'alert-info',
    error: 'alert-danger',
    alert: 'alert-danger'
  }.freeze

  def current_year
    Date.today.year.to_s
  end

  def github_url(author, repo)
    link_to 'Project on Github.com', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def alert_category(level)
    ALERT_CATEGORIES[level.to_sym] || 'alert-secondary'
  end
end
