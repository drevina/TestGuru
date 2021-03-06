module ApplicationHelper

  def github_url(author, repo)
    link_to "Github", "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def current_year
    Date.today.year
  end

  def flash_helper(type)
    if flash[type]
      content_tag :p, flash[type], class:'flash alert'
    end
  end

end
