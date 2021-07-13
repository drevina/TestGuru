module ApplicationHelper

  def github_url(author, repo)
    return "https://github.com/#{author}/#{repo}"
  end

  def current_year
    Date.today.year
  end

end
