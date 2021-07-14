module ApplicationHelper

  def github_url(author, repo)
    link_to "Project", "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def current_year
    Date.today.year
  end

end
